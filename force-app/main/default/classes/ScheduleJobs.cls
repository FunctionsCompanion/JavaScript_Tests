global class ScheduleJobs implements Schedulable {
    static boolean stopScheduler = false;
    global void execute(SchedulableContext ctx) {
		testExecute();
    }
    public static void runScheduler(){
        stopScheduler = false;
        Map<string, fcConfig__c> mapConfigsUpdate = new Map<string, fcConfig__c>();
        List<fcConfig__c> configs = [SELECT id, fcKey__c, fcValue__c FROM fcConfig__c WHERE fcKey__c IN ('schJobId', 'schJobNum')];
        if(configs.size() > 0) delete configs;
        testExecute();
    }
    public static void stopScheduler(){
        stopScheduler = true;
    }
    public static void testExecute(){
        String jobID = '';
        string schJobId = '';
        integer schJobNum = 0;
        fcConfig__c[] configSchedule1 = new fcConfig__c[0];
        fcConfig__c[] configSchedule2 = new fcConfig__c[0];
        Map<string, fcConfig__c> mapConfigsUpdate = new Map<string, fcConfig__c>();
        List<fcConfig__c> configs = [SELECT id, fcKey__c, fcValue__c FROM fcConfig__c WHERE fcKey__c IN ('schJobId', 'schJobNum')];
        for(fcConfig__c configkey: configs){
            switch on configkey.fcKey__c {
                when 'schJobId' {
                    configSchedule1.add(configkey);
                    schJobId = string.valueof(configkey.get('fcValue__c'));
                }
                when 'schJobNum' {
                    configSchedule2.add(configkey);
                    schJobNum = integer.valueof(configkey.get('fcValue__c'));
                }
            }
        }
        if(schJobId != '') {
            try{
            	System.abortJob(schJobId);
            }catch(Exception e){}
        }

        if(!stopScheduler || schJobNum < 100){
            // Scheduler task start
            String Jsonpayload1 = '{"sentimentsmessage": "This invoke is queued"}';
            FCFunction.getAndQueue('JavaScript_Tests.sentiment', Jsonpayload1, 'FCCallbackWaitShort' );
            FCFunction.getAndInvoke('JavaScript_Tests.sentiment', Jsonpayload1);

            String Jsonpayload = '{"passage": "Google LLC is an American multinational Corporation.", "question": "Is Google an American company?"}';
            FCFunction.getAndQueue('JavaScript_Tests.qna', Jsonpayload, 'FCCallbackWaitShort' );
            FCFunction.getAndInvoke('JavaScript_Tests.qna', Jsonpayload);
            // Scheduler task end

            datetime start = system.now().addSeconds(2);
            try{
                jobID = System.schedule('LONG_RUNNING_TXN_MON', start.second()+' '+start.minute()+' * ? * 1-7', new ScheduleJobs());
            }catch(Exception e){ system.debug('System.schedule Error:' + e.getMessage()); }
            if(schJobId != '') {
                configSchedule1[0].fcValue__c = jobID;
                update configSchedule1;
                configSchedule2[0].fcValue__c = string.valueof(schJobNum+1);
                update configSchedule2;
            } else if(configs.size() == 0) {
                insert new fcConfig__c(fcKey__c = 'schJobId', fcValue__c = jobID);
                insert new fcConfig__c(fcKey__c = 'schJobNum', fcValue__c = '1');
        	}
        } else {
            if(schJobId != '') {
                configSchedule1[0].fcValue__c = '';
                update configSchedule1;
                configSchedule2[0].fcValue__c = '0';
                update configSchedule2;
            }
        }
    }
}