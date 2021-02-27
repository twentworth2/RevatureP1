public class Tracking_CC {
	
    public List<Mail__c> mails {get;set;}
    public String searchText {get; set;}
    public Boolean searched{get; set;}
    
    
    public Tracking_CC(){
        searched = false;
        String nameStr = apexPages.currentPage().getParameters().get('searchText');
        if(null!=nameStr){
            searchText= nameStr;
        }
    }
    
    public PageReference search(){
        if(String.isNotBlank(searchText) && searchText.length() > 10){
            searched = true;
            String searchStr = searchText;
            mails = [SELECT ID, Name, Delivered__c, Inhabitant__r.name, Route__r.name FROM Mail__c WHERE Name Like: searchStr];
        } else {
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