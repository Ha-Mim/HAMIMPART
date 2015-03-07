using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HAMIMPART.Models
{
    public class OrderedList
    {
        public int OrderedListId { set; get; }
        public int UserId { set; get; }
        public int ProductId { set; get; }
        public int Quantity { set; get; }
        public double Price { set; get; }
        public virtual User User { set; get; }
        public virtual Product Product { set; get; }
    }
}