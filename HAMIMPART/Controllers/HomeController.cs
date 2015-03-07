using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using HAMIMPART.Models;

namespace HAMIMPART.Controllers
{
    public class HomeController : Controller
    {
        VaazarDbContext db=new VaazarDbContext();
        public ActionResult Index()
        {
            ViewBag.product = db.Products.Where(a=>a.CategoryId<3).ToList();
            ViewBag.Clothing = db.Products.Where(a => a.CategoryId == 3).ToList();
            ViewBag.Category = db.Categories.ToList();
            return View();
        }
     
        public JsonResult GetSubCategoryByCategoryId(int CategoryId)
        {
            var subcategoryList = db.SubCategories.Where(a => a.CategoryId == CategoryId).ToList();
            return Json(subcategoryList, JsonRequestBehavior.AllowGet);
        }
        private int isExisting(int id)
        {
            List<Item> cartList = (List<Item>)Session["cart"];
            for (int i = 0; i < cartList.Count; i++)
                if (cartList[i].ACart.ProductId == id)
                    return i;
            return -1;
        }
        public ActionResult OneProduct(int? id)
        {
            var products = db.Products.Find(id);
            ViewBag.products = products;
            return View();
        }
        public ActionResult OrederNow(int id)
        {
            if (Session["cart"] == null)
            {
                List<Item> cartList = new List<Item>();
                cartList.Add(new Item(db.Products.Find(id), 1));
                Session["cart"] = cartList;
            }
            else
            {
                List<Item> cartList = (List<Item>)Session["cart"];
                int index = isExisting(id);
                if (index == -1)
                {
                    cartList.Add(new Item(db.Products.Find(id), 1));
                }
                else
                {
                    cartList[index].Quantity++;
                    Session["cart"] = cartList;
                }

            }
            return View("OrederNow");
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public JsonResult SaveUser(string selname, string selemail, string selpass, string selphone)
        {
            User aUser = new User() { Name = selname, Email = selemail, Password = selpass, MobileNo = selphone };
            db.Users.Add(aUser);
            db.SaveChanges();

            MailMessage mail = new MailMessage();
            mail.To.Add(aUser.Email);
            mail.From = new MailAddress("hamim.hyder@gmail.com");
            mail.Subject = "New Account Open";
            string Body = "Your User name is "+ aUser.Name+ " and Password is "+ aUser.Password;
            mail.Body = Body;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 25;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential
            ("hamim.hyder@gmail.com", "saddam6814");// Enter seders User name and password  
            smtp.EnableSsl = true;
            smtp.Send(mail);
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        public ActionResult PriceLow()
        {
            ViewBag.Category = db.Categories.ToList();
            ViewBag.product = db.Products.OrderBy(a => a.Price).ToList();
            return View("Index");
        }
        public ActionResult PriceHigh()
        {
            ViewBag.Category = db.Categories.ToList();
            ViewBag.product = db.Products.OrderByDescending(a => a.Price).ToList();
            return View("Index");
        }
        public JsonResult ValidateUser(string email, string password)
        {
            var user = db.Users.FirstOrDefault(a => a.Email == email && a.Password == password);
            if (user != null)
            {
                Session["user"] = user.UserId;
                return Json(true, JsonRequestBehavior.AllowGet);
            }

            return Json(false, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Product(int? catId, int? subId)
        {
            ViewBag.Category = db.Categories.ToList();
            
            var product = db.Products.Where(a => a.CategoryId == catId && a.SubCategoryId == subId).ToList();
            ViewBag.product = product;
           
            return View("Index");

        }
        public ActionResult Remove(int id)
        {
            int index = isExisting(id);
            List<Item> cartList = (List<Item>)Session["cart"];
            cartList.RemoveAt(index);
            Session["cart"] = cartList;
            return View("OrederNow");
        }

    }
}