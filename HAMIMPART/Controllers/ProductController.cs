using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using HAMIMPART.Models;

namespace HAMIMPART.Controllers
{
    public class ProductController : Controller
    {
        //
        // GET: /Product/
        VaazarDbContext db = new VaazarDbContext();
        public ActionResult Index()
        {
            ViewBag.CategoryId = db.Categories.ToList();
           
            return View();
        }

        [HttpPost]
        public ActionResult Index(Product aProduct)
        {
            aProduct.UserId = Convert.ToInt32(Session["user"]);
            ViewBag.CategoryId = db.Categories.ToList();
            if (ModelState.IsValid)
            {
                db.Products.Add(aProduct);
                db.SaveChanges();
            }
            var wishProduct =
                db.Products.Where(a => a.CategoryId == aProduct.CategoryId && a.SubCategoryId == aProduct.SubCategoryId)
                    .ToList();
            var user = db.Users.Find(aProduct.UserId);
            foreach (Product newProduct in wishProduct)
            {
                if (db.OrderedLists.FirstOrDefault(a => a.ProductId == newProduct.ProductId) != null)
                {
                    MailMessage mail = new MailMessage();
                    mail.To.Add(user.Email);
                    mail.From = new MailAddress("hamim.hyder@gmail.com");
                    mail.Subject = "New Product Available";
                    string Body = "A new " + aProduct.Title + " is available in our shop";
                    mail.Body = Body;
                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 25;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new System.Net.NetworkCredential
                        ("hamim.hyder@gmail.com", "saddam6814"); // Enter seders User name and password  
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
            return View();
                }
            
            
           
        

       
        public JsonResult GetSubCategoryByCategoryId(string CategoryId)
        {
            int id = Convert.ToInt16(CategoryId);
            var subcategoryList = db.SubCategories.Where(a => a.CategoryId == id).ToList();
            return Json(subcategoryList, JsonRequestBehavior.AllowGet);
        }

       
        public JsonResult Image(IEnumerable<HttpPostedFileBase> files)
        {
            foreach (var file in files)
            {
                var filename = Path.Combine(Server.MapPath("~/App_Data"), file.FileName);
                file.SaveAs(filename);
            }
            return Json(files.Select(x => new { name = x.FileName }));
        }
	}
}