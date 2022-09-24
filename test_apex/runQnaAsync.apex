String Jsonpayload = '{"passage": "Google LLC is an American multinational Corporation.", "question": "Is Google an American company?"}';
FCFunction.getAndInvoke('SentimentFunctions_1_5.qna', Jsonpayload, 'FCCallback' );


