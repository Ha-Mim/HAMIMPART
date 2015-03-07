using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HAMIMPART.Models
{
    public class SubCategory
    {
        public int SubCategoryId { set; get; }
        public string Name { set; get; }
        public int CategoryId { set; get; }
        public  Category Category { set; get; }
        public ICollection<Product> Products { set; get; }
         
    }
}