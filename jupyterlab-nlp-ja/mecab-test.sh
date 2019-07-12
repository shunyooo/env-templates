TEXT="ピコ太郎さんはカナブンに角をつけてカブトムシとして売るバイトをしている"
echo "\033[0;31mPure Mecab Test\033[0;39m"
echo $TEXT
echo $TEXT | mecab

echo "\033[0;31mNEologd Mecab Test\033[0;39m"
echo $TEXT
echo $TEXT | mecab -d /usr/lib/mecab/dic/mecab-ipadic-neologd