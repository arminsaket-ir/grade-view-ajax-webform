using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;


public partial class index : System.Web.UI.Page
{

    [WebMethod]
    public static int getSize()
    {
        return books.Count;
    }

    [WebMethod]
    public static List<book> getAll(string st, string cu)
    {
        int s = Convert.ToInt32(st);
        int c = Convert.ToInt32(cu);

        if (s + c > books.Count)
        {
            c = books.Count - s;
        }

        return books.GetRange(s, c);
    }






    public class book

    {

        public int id;
        public string fname;
        public string pic;
        public double star;
        public double price;
        public string describe;

        public book(int id, string fname, string pic, double star, double price, string describe)
        {

            this.id = id;
            this.fname = fname;
            this.pic = pic;
            this.star = star;
            this.price = price;
            this.describe = describe;

        }

    }


    public static List<book> books = new List<book>();
    protected void Page_Load(object sender, EventArgs e)
    {
        books.Clear();

        books.Add(new book(1, "صد سال تنهایی", "1.jpg", 3.2, 25000, "نویسنده گابریل گارسیا مارکز"));
        books.Add(new book(2, "فیزیک کوانتمی", "2.jpg", 2.5, 36000, "نویسنده برایان کاکس"));
        books.Add(new book(3, "دو قرن سکوت", "3.jpg", 4.1, 50000, "نویسنده دکتر عبدالحسین زرین کوب"));
        books.Add(new book(4, "کیمیاگر", "4.jpg", 2.6, 10000, "نویسنده پائولو کوئیلو"));
        books.Add(new book(5, "نامه به کودکی که هرگز زاده نشد", "5.jpg", 3.5, 33000, "نویسنده اوریانا فالاچی"));
        books.Add(new book(6, "انقلاب کبیر فرانسه", "6.jpg", 3.5, 22000, "نویسنده آلبرماله – ژول ایزاک"));
        books.Add(new book(7, "سینوهه پزشک مخصوص فرعون", "7.jpg", 2.4, 50000, "نویسنده میکا والتاری"));
        books.Add(new book(8, "کنیز ملکه مصر", "8.jpg", 4.4, 44000, "نویسنده میکل پیرامو"));
        books.Add(new book(9, "دزیره", "9.jpg", 3.3, 10000, "نویسنده آن ماری سلینکو "));
        books.Add(new book(10, "نبرد من", "10.jpg", 3.4, 65000, "نویسنده آدولف هیتلر"));
        books.Add(new book(11, "وینستون چرچیل", "11.jpg", 3.3, 12000, "نویسنده برندا هاوگن"));
        books.Add(new book(12, "فوتبال علیه دشمن", "12.jpg", 4.4, 20000, "نویسنده سایمون کوپر"));
        books.Add(new book(13, "پاسخ به تاریخ", "13.jpg", 4.9, 55000, "نویسنده محمدرضا پهلوی"));
        books.Add(new book(14, "گشت شبانه", "14.jpg", 2.2, 40000, "نویسنده پاتریک مودیانو"));




    }
}