String Jsonpayload1 = '{"sentimentsmessage": "This invoke is queued"}';

//Run the  function sync...
//FCFunction.getAndQueue('JavaScript_Tests.sentiment', Jsonpayload1);
//Run thge functions async....
FCFunction.getAndQueue('JavaScript_Tests.sentiment', Jsonpayload1, 'FCCallbackWaitLong' );


