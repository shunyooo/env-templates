TEXT="ピコ太郎さんはカナブンに角をつけてカブトムシとして売るバイトをしている"
# printf "\e[31;4mPure Mecab Test\033[0;39m"
echo "======================="
echo "|   Pure Mecab Test   |"
echo "======================="
echo $TEXT
echo $TEXT | mecab

# printf "\e[31;4mNEologd Mecab Test\033[0;39m"
echo "========================"
echo "|  NEologd Mecab Test  |"
echo "========================"
echo $TEXT
echo $TEXT | mecab -d /usr/lib/mecab/dic/mecab-ipadic-neologd

# printf "\e[36;4mGINZA Test\033[0;39m"
echo "======================"
echo "|     GINZA Test     |"
echo "======================"
echo $TEXT
echo $TEXT | ginza
