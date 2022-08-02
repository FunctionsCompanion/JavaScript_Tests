String Jsonpayload = '{"sentimentsmessage": "This invoke is queued"}';

//Run the  function sync...
FCFunction.getAndInvoke('JavaScript_Tests.sentiment', Jsonpayload);
//FCFunction.getAndInvoke('JavaScript_Tests.sentiment', Jsonpayload);
//FCFunction.getAndInvoke('JavaScript_Tests.sentiment', Jsonpayload);
//Run thge functions async....
//FCFunction.getAndInvoke('JavaScript_Tests.sentiment', Jsonpayload1, 'FCCallback' );


