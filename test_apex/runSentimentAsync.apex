String Jsonpayload1 = '{"sentimentsmessage": "This invoke is queued"}';

//Run the  function sync...
//FCFunction.getAndInvoke('JavaScript_Tests.sentiment', Jsonpayload1);
//Run thge functions async....
FCFunction.getAndInvoke('JavaScript_Tests.sentiment', Jsonpayload1, 'FCCallback' );


