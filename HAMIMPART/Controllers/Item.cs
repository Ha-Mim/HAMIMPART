using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HAMIMPART.Models;

namespace HAMIMPART.Controllers
{
    public class Item
    {
        private Product aCart = new Product();

        public Item()
        {
            
        }
        public Product ACart
        {
            set { aCart = value; }
            get { return aCart; }
        }
        private int quantity;

        public int Quantity
        {
            set { quantity = value; }
            get { return quantity; }
        }



        public Item(Product aCart, int quantity)
        {
            this.aCart = aCart;
            this.quantity = quantity;
        }
    }
}