namespace HAMIMPART.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class session : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "UserId", c => c.Int());
            CreateIndex("dbo.Products", "UserId");
            AddForeignKey("dbo.Products", "UserId", "dbo.Users", "UserId", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Products", "UserId", "dbo.Users");
            DropIndex("dbo.Products", new[] { "UserId" });
            DropColumn("dbo.Products", "UserId");
        }
    }
}
