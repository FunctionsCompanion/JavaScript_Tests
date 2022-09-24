String Jsonpayload = '{"sentimentsmessage": "This invoke is queued"}';

//Run the  function sync...
FCFunction.getAndInvoke('Sent_1.sentiment', Jsonpayload);
//FCFunction.getAndInvoke('Sent_1.sentiment', Jsonpayload);
//FCFunction.getAndInvoke('Sent_1.sentiment', Jsonpayload);
//Run thge functions async....
//FCFunction.getAndInvoke('Sent_1.sentiment', Jsonpayload1, 'FCCallback' );


