String Jsonpayload = '{"sentimentsmessage": "This invoke is queued"}';

//Run the  function sync...
FCFunction.getAndInvoke('SentimentFunctions_1-5.sentiment', Jsonpayload);
//FCFunction.getAndInvoke('SentimentFunctions_1-5.sentiment', Jsonpayload);
//FCFunction.getAndInvoke('SentimentFunctions_1-5.sentiment', Jsonpayload);
//Run thge functions async....
//FCFunction.getAndInvoke('SentimentFunctions_1-5.sentiment', Jsonpayload1, 'FCCallback' );


