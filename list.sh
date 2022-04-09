#!/bin/sh

osascript <<EOF

--七麦排行榜
set Link to "https://www.qimai.cn/rank/index/brand/free/country/cn/genre/5000/device/iphone"
--每页50个,默认显示Top100
set PageCount to 2
set AppCount to PageCount * 50
--加载等待时长
set Duration to 2

set js to "
let apps = document.getElementsByClassName('app-name')
var result = [];
for (let app of apps) {
    if (app instanceof HTMLAnchorElement) {
        let name = app.text.trim();
        let href = app.href.replace('rank', 'baseinfo');
        result.push({n:name, h:href});
    }
}
result;
"
set i to 0
set AppList to {}

tell application "Google Chrome"
	activate
	open location Link
	repeat PageCount times
		delay Duration
		execute front window's active tab javascript "window.scrollBy(0,document.body.scrollHeight);"
	end repeat
	set Apps to ¬
		execute front window's active tab javascript js
	repeat with anApp in Apps
		set i to i + 1
		if i > AppCount then
			exit repeat
		end if
		
		set appName to n of anApp
		set appLink to h of anApp
		
		close front window's active tab
		open location appLink
		delay Duration
		set sourceHTML to ¬
			execute front window's active tab javascript "document.documentElement.outerHTML"
		set hasWatchApp to sourceHTML contains "<span data-v-eab34610=\"\" class=\"info-txt\">支持</span>"
		
		set end of AppList to {appName:appName, watchApp:hasWatchApp}
		
	end repeat
end tell
AppList