public class NewAccountController
{
    public Account acc;
    public Account getAcc(){
        return acc;
    }
    public void setAcc(Account a){
        acc = a;
    }

   public NewAccountController()
    {
        acc=new Account();
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