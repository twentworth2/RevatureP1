// made this class because i wasnt able to edit the account info due to privlidges
public class AccountController_CC
{
    public Account acc;
    public Account getAcc(){
        return acc;
    }
    public void setAcc(Account a){
        acc = a;
    }

   public AccountController_CC()
    {
    }

    public Pagereference shippingRedirect(){
        Pagereference newPage = Page.Shipping;
        newPage.setRedirect(true);
        return newPage;
    }
    
     public PageReference saveRecord()
      {
             insert acc;

             // edited this so that after the save i wouldnt go to the record page
             Pagereference newPage = Page.SiteTemplate;
             newPage.setRedirect(true);
             return newPage;
      }


}