#!/bin/bash

pagenum=$( \
	curl 'http://caipiao.taobao.com/lottery/order/united_list.htm?lottery_type=SSQ'  | \
	grep -B1 'page-next' | grep -o '[[:digit:]]' | tr -d '\r\n' \
   	)
echo $pagenum

#clear links.txt
echo "" > links.txt

for (( i = 1; i <= $pagenum; i=i+1 )); 
	do curl "http://caipiao.taobao.com/lottery/order/united_list.htm?page=$i&lottery_type=SSQ&sort_obj=perfee&sort=desc&change_sort=true&chg_type=0" | \
		egrep -i -B 4 '<td class="td6">0.20</td>' | \
		grep -Eo '<a .+>.+</a>' >> links.txt; 
done

#add link with <br />
cat links.txt | awk '{print $0, "<br />"}' > linksWithBr.txt

echo "<html xmlns='http://www.w3.org/1999/xhtml'><head><title>caipiao</title><script type='text/javascript' src='http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.js'> </script>" > autoclick.html
echo "<script type='text/javascript'>" >> autoclick.html
echo '$(function(){var anwser=confirm("Do you want purchase all of lottery?");if(anwser){$("a").each(function(){var url=$(this).attr("href");window.open(url)})}});' >> autoclick.html
echo "</script></head><body>" >> autoclick.html
cat linksWithBr.txt >> autoclick.html 
echo "</body></html" >> autoclick.html
