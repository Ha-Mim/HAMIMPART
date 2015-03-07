using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HAMIMPART.Models
{
    public class Product
    {
        public int ProductId { set; get; }
        [Required]
        [StringLength(100)]
        public string Title { set; get; }
        [StringLength(100)]
        
        public string ImagePath { set; get; }
        [StringLength(100)]

        public string Specification { set; get; }
        [StringLength(100)]
        [DataType(DataType.MultilineText)]
        public string Description { set; get; }
        public int Quantity { set; get; }
        public double Price { set; get; }
        public int CategoryId { set; get; }

        public Category CategoryName { set; get; }

        public int SubCategoryId { set; get; }

        public SubCategory SubCategoryName { set; get; }
        public string Model { set; get; }
        public string Brand { set; get; }
        public string HardDisk { set; get; }
        public string Ram { set; get; }
        public string MadeBy { set; get; }
        public string Size { set; get; }
        public int UserId { set; get; }
        public User Users { set; get; }
        //public ICollection<ProductReview> ProductReviews { set; get; }
            //public ICollection<WishList> WishLists { set; get; }
            public ICollection<OrderedList> OrderedLists { set; get; }

        }
}