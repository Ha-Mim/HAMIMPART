using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HAMIMPART.Models
{
    public class User
    {

        public int UserId { get; set; }
        [Required]
        public string Name { get; set; }
        [DataType(DataType.EmailAddress)]
        [Required]
        public string Email { get; set; }
        [DataType(DataType.Password)]
        [Required]
        public string Password { get; set; }
        
        [Required]
        public string MobileNo { get; set; }
        public ICollection<Product> Products { set; get; }
        public ICollection<OrderedList> OrderedLists { set; get; }
        

       
    }
}