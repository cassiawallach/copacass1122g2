@IsTest
private class HouseServiceTest {
    
    @IsTest
    static void testGetRecords() {
        // Create test records
        List<House__c> houses = new List<House__c>();
        for(Integer i=0; i<10; i++) {
            House__c h = new House__c();
            h.Name = 'Test House ' + i;
            h.Address__c = '123 Test Street';
            h.State__c = 'CA';
            h.City__c = 'San Francisco';
            h.Zip__c = '94101';
            houses.add(h);
        }
        insert houses;
        
        // Call the getRecords method
        Test.startTest();
        List<House__c> result = HouseService.getRecords();
        Test.stopTest();
        
        // Verify the results
        System.assertEquals(10, result.size(), 'Wrong number of records returned');
        System.assertEquals('Test House 0', result[0].Name, 'Wrong record order or content');
        System.assertEquals('Test House 9', result[9].Name, 'Wrong record order or content');
    }
}