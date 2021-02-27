public inherited sharing class ShippingPageController {

    public ApexPages.StandardSetController ssc {get; set;}

    // delivery status that user wants to filter by 
    public String deliveryStatus {get; set;}

    // public String currentUserName{get{
    //     if(currentUserName == null){
    //         currentUserName = currentUser.Name;
    //     }
    //     return currentUserName;
    // }set;}

    public User currentUser {get{
        if(currentUser == null)
        {
            currentUser = [SELECT Id, Name FROM User WHERE Id=:userinfo.getuserId()];
        }
        return currentUser;
    } set;}

    // public static void shareMailRecord(Id mailToShare, Id userToShareWith){
    //     Mail__Share mShare = new Mail__Share();
    //     mShare.Id = mailToShare;
    //     mShare.UserOrGroupId = userToShareWith;
    //     mShare.AccessLevel = 'Read';
    //     mShare.RowCause = 'Manual';
    //     insert mShare;
    // }

    // what the list controller will sort by 
    private String sortedByVal = 'Name';

    // determines whether or not our list controller should filter
    private Boolean isFiltered = false;

    /* class constructor */
    public ShippingPageController() {
        this.deliveryStatus = 'View All';
        setSSC();
    }

    // @description mail getter
    public List<Mail__c> getMail(){
        return (List<Mail__c>)ssc.getRecords();
    }

// @description Sets our Standard List Controller, based off of whether or not it needs to be filtered 
public void setSSC(){

    String baseQuery = 'SELECT Inhabitant__r.Name, Name, Height_inches__c, Width_inches__c,' +  
                       'Weight_Oz__c, Route__c, Delivered__c FROM Mail__c WHERE Inhabitant__r.Name = \''
                       + currentuser.Name + '\' ';
    if(this.isFiltered){
        this.ssc = new ApexPages.StandardSetController(Database.query(
                baseQuery + ' AND Delivered__c = :deliveryStatus' + 
                ' ORDER BY '+ sortedByVal + ' ASC'
        ));
    } else {
        this.ssc = new ApexPages.StandardSetController(Database.query(
                baseQuery + 'ORDER BY '+ sortedByVal + ' ASC'
        ));
    }
}

    // @description Checks if our query needs to be filtered or not
    public void getStatus(){
        if(this.deliveryStatus == 'View All'){
            this.isFiltered = false;
        } else {
            this.isFiltered = true;
        }

        setSSC();
    }

    public void sortByName(){
        this.sortedByVal = 'Name';
        setSSC();
    }
    
    public void sortByHeight(){
        this.sortedByVal = 'Height_inches__c';
        setSSC();
    }

    public void sortByWidth(){
        this.sortedByVal = 'Width_inches__c';
        setSSC();
    }

    public void sortByWeight(){
        this.sortedByVal = 'Weight_Oz__c';
        setSSC();
    }

    public void sortByRoute(){
        this.sortedByVal = 'Route__c';
        setSSC();
    }

    public void sortByStatus(){
        this.sortedByVal = 'Delivered__c';
        setSSC();
    }

    public PageReference siteTemplateRedirect(){
        Pagereference newPage = Page.SiteTemplate;
        newPage.setRedirect(true);
        return newPage;
    }
}