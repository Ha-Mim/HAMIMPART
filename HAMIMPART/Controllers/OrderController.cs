using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HAMIMPART.Models;

namespace HAMIMPART.Controllers
{
    public class OrderController : Controller
    {
        VaazarDbContext db = new VaazarDbContext();
        //
        // GET: /Order/Buyer
        public ActionResult Index()
        {
            var id = Convert.ToInt16(Session["user"]);
            double total = 0;
            var orders = db.OrderedLists.Where(a => a.UserId == id).ToList();
            foreach (var anOrder in orders)
            {
                var totalPrice = anOrder.Quantity * anOrder.Price;
                total += totalPrice;
            }
            ViewBag.Total = total;
            return View(orders);
        }
        //Seller
        public ActionResult OrderList()
        {
            var test = db.Products.Join(db.OrderedLists, pro => pro.ProductId, ol => ol.ProductId,
                (pro, ol) => new {pro, ol});
              
            var id = Convert.ToInt16(Session["user"]);
            var products =
                db.Products.Where(a => a.UserId == 2)
                    .Join(db.OrderedLists, u => u.ProductId, uir => uir.ProductId, (u, uir) => new { u, uir })
                    .Select(m => new Item()
                    {
                        ACart = m.u,
                        Quantity = m.uir.Quantity
                    })
                    .ToList();
            ViewBag.deliveredList = products;
            return View();
        }
    }
}