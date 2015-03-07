namespace HAMIMPART.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class order : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.OrderedLists",
                c => new
                    {
                        OrderedListId = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        ProductId = c.Int(nullable: false),
                        Quantity = c.Int(nullable: false),
                        Price = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.OrderedListId)
                .ForeignKey("dbo.Products", t => t.ProductId)
                .ForeignKey("dbo.Users", t => t.UserId)
                .Index(t => t.UserId)
                .Index(t => t.ProductId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.OrderedLists", "UserId", "dbo.Users");
            DropForeignKey("dbo.OrderedLists", "ProductId", "dbo.Products");
            DropIndex("dbo.OrderedLists", new[] { "ProductId" });
            DropIndex("dbo.OrderedLists", new[] { "UserId" });
            DropTable("dbo.OrderedLists");
        }
    }
}
