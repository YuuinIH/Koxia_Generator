rm -rf moning.txt foodlist.txt sent.txt
for ((i=1;i<=10;i++))
do
  curl 'https://api.bilibili.com/x/space/dynamic/search?keyword=今日&mid=690608690&pn='"$i"'&ps=50&platform=web' |\
  jq -r '.data.cards[].card'|\
  jq -r '.item.description' >> moning.txt
done
  grep -E '早餐|午餐|晚餐' moning.txt >> foodlist.txt
  grep -v '早餐\|午餐\|晚餐\|こんしや' moning.txt >> sent.txt