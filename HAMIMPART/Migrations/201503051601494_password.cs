namespace HAMIMPART.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class password : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Users", "PasswordConfirm");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Users", "PasswordConfirm", c => c.String());
        }
    }
}
