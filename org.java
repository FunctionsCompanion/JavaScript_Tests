public with sharing class GeneratePDFCallbackCls implements functions.FunctionCallback {
    String fnName;
        Integer execTimes;
        Id execRequestId;
​
        public GeneratePDFCallbackCls(){}
​
        public void handleResponse(functions.FunctionInvocation result) {  
            try{
                Value_Pair__c pdfBatchSize = Value_Pair__c.getInstance('PDF Batch Size');
                Integer batchSize = Integer.valueOf(pdfBatchSize.Value__c);
​
                // Check if there is any error during the invocation
                if (result.getStatus() == functions.FunctionInvocationStatus.ERROR) {
                    insert new PDF_Generate_Response__c(
                        Function_Name__c = fnName,
                        Failed_PDFs__c = batchSize,
                        PDF_Generate_Request__c = this.execRequestId
                    );
                    // Handle result of function invocation
                    String jsonResponse = result.getResponse();
                    if (String.isNotBlank(jsonResponse)) {
                        PDFGenRequestTriggerHelper.Response resp = (PDFGenRequestTriggerHelper.Response) JSON.deserialize(
                            jsonResponse,
                            PDFGenRequestTriggerHelper.Response.class
                        );   
                        this.fnName = resp.fnName;
                        this.execTimes = resp.numExecs;
                        this.execRequestId = resp.execRequestId;
                        if(this.execTimes > 0){
                            this.execTimes--;
                            PDFGenRequestTriggerHelper.daisyChain(fnName, batchSize, this.execTimes, this.execRequestId);
                        } 
                    }                                     
                }else{
                    // Handle result of function invocation
                    String jsonResponse = result.getResponse();
                    if (String.isNotBlank(jsonResponse)) {
                        PDFGenRequestTriggerHelper.Response resp = (PDFGenRequestTriggerHelper.Response) JSON.deserialize(
                            jsonResponse,
                            PDFGenRequestTriggerHelper.Response.class
                        );       
                        this.fnName = resp.fnName;
                        this.execTimes = resp.numExecs;
                        this.execRequestId = resp.execRequestId;
                                    
                        insert new PDF_Generate_Response__c(
                            Function_Name__c = resp.fnName,
                            Invokation_Start__c = resp.invokationStart,
                            Invokation_End__c = resp.invokationEnd,
                            Invokation_Time__c = resp.invokationTime,
                            Processed_PDFs__c = resp.loops,
                            Failed_PDFs__c = 0,
                            PDF_Generate_Request__c = this.execRequestId
                        );
                    }else{
                        insert new PDF_Generate_Response__c(
                            Function_Name__c = 'NO IDEA',
                            Failed_PDFs__c = batchSize,
                            PDF_Generate_Request__c = null
                        );
                    }
                    if(this.execTimes > 0){
                        this.execTimes--;
                        PDFGenRequestTriggerHelper.daisyChain(fnName, batchSize, this.execTimes, this.execRequestId);
                    }                
                }            
            }catch(Exception e){
                System.debug(LoggingLevel.ERROR, 'Error on GeneratePDFCallback. Error: '+e.getMessage()+' Function: '+this.fnName);
            }
                    
        }
    }