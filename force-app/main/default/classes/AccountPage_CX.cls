public class AccountPage_CX {

 
        private Account acct;
        ApexPages.StandardController controller;
        
        // The extension constructor initializes the private member
        // variable acct by using the getRecord method from the standard
        // controller.
        public AccountPage_CX(ApexPages.StandardController stdController) {
            this.acct = (Account)stdController.getRecord();
        }

        public Pagereference shippingRedirect(){
            Pagereference newPage = Page.Shipping;
            newPage.setRedirect(true);
            return newPage;
        }

        public Pagereference siteTemplateRedirect(){
            Pagereference newPage = Page.SiteTemplate;
            newPage.setRedirect(true);
            return newPage;
        }
     
        public Pagereference saveAndRedirect() {

            if(controller.save() != null) { 
                PageReference ref = Page.SiteTemplate; 
                ref.setRedirect(true); 
                return ref; 
            } 
                return null;
            // if(controller.save() != null) {
            //   PageReference redirectPage = Apexpages.currentPage();
            //   redirectPage.setRedirect(true);
            //   redirectPage.getParameters().put('id',controller.getId());
            //   return redirectPage;
            // } return null;
          }
}