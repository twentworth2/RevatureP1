public class AccountPage_CX {

 
        private Account acct;
        ApexPages.StandardController controller;
        public User currentUser{get;set;}
        public String userAccountID {get;set;}
        public String userFirstName {get;set;}
        // The extension constructor initializes the private member
        // variable acct by using the getRecord method from the standard
        // controller.
        public AccountPage_CX(ApexPages.StandardController stdController) {
            currentUser = [SELECT AccountId, Id, FirstName FROM User WHERE Id=:userinfo.getuserId()];
            userAccountID = currentUser.AccountId;
            userFirstName = currentUser.FirstName;

            this.acct = (Account)stdController.getRecord();
        }

        public Pagereference accountEditRedirect(){
            Pagereference newPage;
            
            if(userAccountID == null)
            {
              newPage = Page.SiteTemplate;
            }
            else{
                newPage = new Pagereference('/apex/accountEdit?id=' + userAccountID);
            }
            
            newPage.setRedirect(true);
            return newPage;
        }

        public Pagereference shippingRedirect(){
            Pagereference newPage = Page.Shipping;
            newPage.setRedirect(true);
            return newPage;
        }

        public Pagereference trackingRedirect(){
            Pagereference newPage = Page.Tracking;
            newPage.setRedirect(true);
            return newPage;
        }

        public Pagereference siteTemplateRedirect(){
            Pagereference newPage = Page.SiteTemplate;
            newPage.setRedirect(true);
            return newPage;
        }
     
}