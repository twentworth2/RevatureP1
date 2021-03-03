public class Tracking_CC {
	
    public List<Mail__c> mails {get;set;}
    public String searchText {get; set;}
    public Boolean searched{get; set;}
    public Boolean error{get; set;}

    public User currentUser {get{
        if(currentUser == null)
        {
            currentUser = [SELECT Id, Name FROM User WHERE Id=:userinfo.getuserId()];
        }
        return currentUser;
    } set;}
    
    
    public Tracking_CC(){
        searched = false;
        error = false;
        String nameStr = apexPages.currentPage().getParameters().get('searchText');
        if(null!=nameStr){
            searchText= nameStr;
        }
    }
    
    public PageReference search(){
        if(String.isNotBlank(searchText) && searchText.length() == 12){
            String searchStr = searchText;
            mails = [SELECT ID, Name, Delivered__c, Inhabitant__r.name, Route__r.name FROM Mail__c WHERE Name Like: searchStr AND Inhabitant__r.Name =: currentUser.Name];

            if (mails.isEmpty()){
            searched = false;
            error = true;
            ApexPages.addMessage(
                new ApexPages.message(
                    ApexPages.severity.ERROR,
                    'We couldn\'t find a package with this tracking number belonging to you.'
                    )
                );
            }
            else {
                searched = true;
                error = false;
            }
        } else {
            searched = false;
            error = true;
            ApexPages.addMessage(
                new ApexPages.message(
                    ApexPages.severity.ERROR,
                    'Please enter tracking number in the form \'UPS - XXXXXX\''
                )
            );
        }
        return null;
    }

    public Pagereference siteTemplateRedirect(){
        Pagereference newPage = Page.SiteTemplate;
        newPage.setRedirect(true);
        return newPage;
    }
}