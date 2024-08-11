enum StaticPagesTypes {
  TERMSCONDITIONS._(name: "terms_conditions"),
  PRIVACYPOLICY._(name: "privacy_policy"),
  REPLACEMENTREFUNDPOLICY._(name: "replacement_refund_policy");

  final String name;

  const StaticPagesTypes._({required this.name});
}

class StaticPagesText {
  /// Replacement and Refund Policy
  static String refundPolicyEn =
      '1- Customers have the right to cancel the shipping policy within three days maximum from the date of issuance of the policy, provided that it has not been delivered to the shipping company\n'
      '2- Customers have the right to cancel the shipping policy and receive a refund of its value if the shipment has not been delivered to the shipping company, and the amount will be refunded to the customer.\n'
      '3- Shipping companies do not accept the return of shipping policy fees if they have received the policy from the customer and processed it.\n'
      '4- these companies may allow the issuance of a new policy and payment of new fees, allowing for the replacement of the previous policy with the new one.';

  static String refundPolicyAr =
      "1- يحق للعميل الغاء بوليصة الشحن قبل تسليمها لشركة الشحن خلال خمسة ايام بحد اقصى من تاريخ إصدار البوليصة .\n"
      "2- يحق للعميل إلغاء بوليصة الشحن واسترداد قيمتها مالم يتم تسليم الشحنة لشركة الشحن وسيتم إعادة المبلغ للعميل .\n"
      "3- شركات الشحن لا تقبل بإعادة رسوم بوليصة الشحن في حال استلمت البوليصة من العميل وتم التعامل معها .\n"
      "4- تتيح هذه الشركات إمكانية إصدار بوليصة جديدة ودفع رسوم جديدة، مما يتيح استبدال البوليصة السابقة بالجديدة .";

  /// Privacy Policy
  static String privacyPolicyEn1 = 'Last updated on: March 18, 2024\n'
      'This privacy policy outlines how your data is collected in the manner used by Saayer platform. By using saayer.com, you agree to the collection and use of your data by saayer.com and some third-party service providers as stated in this privacy policy. If you do not agree. We advise reading the privacy policy carefully by accessing the services provided by to this privacy policy, please refrain from using this website, saayer.com';
  static String privacyPolicyAr1 = 'آخر تحديث بتاريخ :  18 مارس 2024 \n'
      'سياسة الخصوصية هذه توفر طريقة جمع البيانات الخاصة بك بالطريقة المستخدمة من قبل منصة ساير. ننصح بقراءة سياسة الخصوصية بعناية عن طريق الدخول إلى الخدمات التي تقدمها   saayer.com انك توافق على جمع و استخدام البيانات الخاصة بك عن طريق saayer.com و بعض مقدمي الخدمة طرف ثالث بالطريقة المنصوص عليها في سياسة الخصوصية هذه. إذا كنت لا توافق على سياسة الخصوصية هذه، يرجى عدم استخدام هذا الموقع saayer.com';

  static String privacyPolicyHeaderEn2 = 'Your privacy assurance with saayer.com';
  static String privacyPolicyHeaderAr2 = 'ضمان الخصوصية الخاصة بك مع saayer.com :';
  static String privacyPolicyEn2 =
      'as provided in this privacy policy) without your consent. We and/or authorized third-party service providers are authorized to use the personal information you provide to ensure the services we offer you';
  static String privacyPolicyAr2 =
      'ساير تعد بعدم بيع أو تأجير معلوماتك الشخصية لأي طرف ثالث (باستثناء ما هو منصوص عليه في سياسة الخصوصية هذه) دون موافقتك. نحن و / أو المخولين مزودي الخدمة طرف ثالث المخولين لاستخدام المعلومات الشخصية التي قدمتها لنؤمن لك الخدمات التي نقدمها.';

  static String privacyPolicyHeaderEn3 = 'The third party service providers';
  static String privacyPolicyHeaderAr3 = 'الطرف الثالث – مزودي الخدمة :';
  static String privacyPolicyEn3 =
      'We collaborate with other companies and individuals to perform tasks on our behalf. Examples of such tasks include processing orders, handling shipping documents, sending emails, analyzing data, providing assistance and marketing, delivering search results, processing credit card and debit card payments. They may have access to some personal information necessary to perform their functions, but it is not used for other purposes. We may disclose your information if we believe it is required by law .';
  static String privacyPolicyAr3 =
      'نحن نتعامل مع شركات أخرى و أفراد لأداء المهام نيابة عنا. ومن الأمثلة على ذلك مباشرة الطلبات ، كل ما يخص وثائق الشحن ، إرسال البريد الإلكتروني، تحليل البيانات، تقديم المساعدة والتسويق، تقديم نتائج البحث، تجهيز مدفوعات بطاقات الائتمان وبطاقة الخصم ، لديهم إمكانية الوصول إلى بعض المعلومات الشخصية اللازمة لأداء وظائفهم، ولكن لاتستخدم لأغراض أخرى، و قد نكشف عن معلوماتك في حال اعتقادنا أن هذا الأمر سيكون إذعانًا للقانون .';

  static String privacyPolicyHeaderEn4 = 'The information that can be collected from you includes';
  static String privacyPolicyHeaderAr4 = 'المعلومات التي يمكن جمعها منك :';
  static String privacyPolicyEn4 =
      'Users can visit our website anonymously. However, when requesting a service or registering on our website or application, you will be asked to provide your name, store or company name, email address, phone number, city, district, or other details that will help us provide a better service for you';
  static String privacyPolicyAr4 =
      'يمكن للمستخدمين أن يزوروا موقعنا تحت هوية مجهولة، إلا أنه عند طلب خدمة أو التسجيل في موقعنا الإلكتروني او التطبيق ، سيُطلب منك إدخال اسمك واسم المتجر او الشركة ، وعنوان البريد الإلكتروني  ورقم الهاتف والمدينة والحي ، أو غيرها من التفاصيل التي ستساعدنا على تقديم خدمة أفضل من أجلك .';

  static String privacyPolicyHeaderEn5 = 'Our uses of your information include';
  static String privacyPolicyHeaderAr5 = 'استخداماتنا لمعلوماتك :';
  static String privacyPolicyEn5 = 'We use your personal information and contact details for'
      '\n• Personalizing the user experience and delivering quality content, product offerings, and services that may interest you'
      '\n• Improving our website to provide a better service for you'
      '\n• Providing better service by responding to your customer service inquiries'
      '\n• Organizing contests, special offers, surveys, or other website features'
      '\n• Processing your transactions quickly and efficiently'
      '\n• Sending periodic email messages regarding your purchases or other products and services';
  static String privacyPolicyAr5 = 'نحن نستخدم معلوماتك الشخصية ومعلومات الاتصال من اجل :'
      '\n• إضفاء طابع شخصى على تجربة المستخدم والسماح لأنفسنا بتوصيل نوعية المحتويات وعروض المنتجات والخدمات التي قد تهمك.'
      '\n• تحسين موقعنا الإلكتروني لتقديم خدمة أفضل لك.'
      '\n• السماح لأنفسنا بتقديم خدمة أفضل من أجلك عن طريق الإجابة عن استفساراتك المقدمة لخدمة العملاء.'
      '\n• تنظيم مسابقات أو عروض خاصة أو استطلاعات رأي أو غيرها من سمات الموقع الإلكتروني.'
      '\n• إجراء تعاملاتك بسرعة وكفائة .'
      '\n• إرسال رسائل بريد إلكتروني دورية بخصوص مشترياتك أو المنتجات والخدمات الأخرى .';

  static String privacyPolicyHeaderEn6 = 'Credit card details :';
  static String privacyPolicyHeaderAr6 = 'تفاصيل بطاقة الائتمان :';
  static String privacyPolicyEn6 =
      'We work with a company licensed by the Saudi Arabian Monetary Authority to process payment transactions, and we do not store credit card details in our database or server. It is important for you to protect against unauthorized access to your password or computer. Make sure to log out when you finish using a shared computer .';
  static String privacyPolicyAr6 =
      'نحن نتعامل مع شركة مرخصة من البنك المركزي السعودي تقوم بمعالجة عمليات الدفع و لا نبقي تفاصيل بطاقة الائتمان في قاعدة البيانات المتوفرة لدينا أو السيرفر. من المهم بالنسبة لك الحماية ضد وصول غير المصرح لهم إلى كلمة المرور الخاصة بك أو الكمبيوتر الخاص بك. تأكد من تسجيل الخروج عند الانتهاء من استخدام جهاز كمبيوتر مشترك.';

  static String privacyPolicyHeaderEn7 = 'How do we protect visitor information?:';
  static String privacyPolicyHeaderAr7 = 'كيف نحمي معلومات الزوار ؟ :';
  static String privacyPolicyEn7 =
      'Our entire website undergoes regular comprehensive scanning to detect security vulnerabilities and known weaknesses, ensuring your visit to our website is as safe as possible .Personal information is collected behind secured networks and can only be accessed by a limited number of individuals who have special access permissions to such systems. They are also required to maintain the confidentiality of your information.While we strive to maintain the confidentiality of your personal information, it\'s important to note that transmissions over the internet cannot be guaranteed to be entirely secure .';
  static String privacyPolicyAr7 =
      'يتم عمل مسح شامل لموقعنا الإلكتروني بالكامل بصورة  دورية من أجل اكتشاف الثغرات الأمنية ونقاط الضعف المعروفة من أجل جعل زيارتك لموقعنا الإلكتروني آمنة قدر الإمكان .يتم جمع معلوماتك الشخصية خلف شبكات مؤمَّنة ولا يمكن الدخول إليها إلا بواسطة عدد محدود من الأشخاص الذين يمتلكون تصريح دخول خاص إلى مثل هذه الأنظمة، كما يُطلب منهم الحفاظ على سرية المعلومات .رغم أننا سوف نعمل على الحفاظ على سرية معلوماتك الشخصية، لايمكن أن يكون الارسال الذي يتم بواسطة شبكة الإنترنت أن يكون آمن تماماً.باستخدام هذا الموقع، فإنك توافق على أننا لا نتحمل أية مسؤولية عن الإفصاح عن المعلومات الخاصة بك بسبب أخطاء في الإرسال أو أعمال غير مصرح بها لأطراف ثالثة.';

  static String privacyPolicyHeaderEn8 = 'Can the account be canceled or deleted?';
  static String privacyPolicyHeaderAr8 = 'هل يمكن إلغاء أو حذف الحساب ؟';
  static String privacyPolicyEn8 =
      'Upon your request, we will remove/block your personal information from our database, thus canceling your registration. However, your information may remain stored in archives on our services even after deletion or termination of your account';
  static String privacyPolicyAr8 =
      'بناء على طلبك، سنقوم بإزالة / منع معلوماتك الشخصية من قاعدة بياناتنا، وبالتالي إلغاء التسجيل، ومع ذلك قد تبقى معلوماتك المخزنة في الأرشيف على خدماتنا حتى بعد الحذف أو إنهاء حسابك ';

  static String privacyPolicyHeaderEn9 = 'How can you access and modify your data? :';
  static String privacyPolicyHeaderAr9 = 'كيف يمكنك الوصول إلى البيانات وتعديلها ؟ :';
  static String privacyPolicyEn9 =
      'You can access a wide range of data related to your account and transactions with the website for the purpose of viewing and updating the data in some cases'
      '\nExamples of data you can easily access on the website include:'
      '\n• Updated data regarding your latest service requests.'
      '\n• Personal identification data (including name, email address, address, password, correspondence, and personal advertising preferences ) .'
      '\n• Payment settings (including credit card information )  .'
      '\n• Email and phone notification settings.'
      '\nWe may retain a copy of the data for compliance purposes, especially when you update personal information, as we keep a copy of the previous data for record-keeping in our logs .';
  static String privacyPolicyAr9 =
      'يمكنك الوصول إلى مجموعة كبيرة من البيانات الخاصة بحسابك وتعاملاتك مع الموقع بغرض عرض البيانات وتحديثها في بعض الحالات '
      '\n.أمثلة البيانات التي يمكنك الوصول إليها بسهولة على الموقع'
      '\n• بيانات محدثة فيما يتعلق بأحدث طلبات الخدمة التي قمت به.'
      '\n• بيانات التعريف الشخصي (بما في ذلك، الاسم والبريد الإلكتروني والعنوان وكلمة المرور والمراسلات وتفضيلات الإعلانات الشخصية).'
      '\n• إعدادات الدفع (بما في ذلك معلومات بطاقة الائتمان).'
      '\n• إعدادات إشعارات البريد الإلكتروني والهاتف'
      '\nيجوز أن نحتفظ بنسخة من البيانات لأغراض الامتثال للقوانين، وبالذات عند تحديثك للمعلومات الشخصية حيث نحتفظ بنسخة من البيانات السابقة للحفظ في سجلاتنا .';

  static String privacyPolicyHeaderEn10 = 'Do we use browser cookies? :';
  static String privacyPolicyHeaderAr10 = 'هل نستخدم سجلات المتصفح (cookies) ؟ :';
  static String privacyPolicyEn10 =
      'Yes, our system will place cookies when you log in to the website to ensure a pleasant and seamless user experience throughout the site. You can disable cookies by changing your browser settings, and if you do, it may affect how our site functions, and you may not be able to access or use some or all of the site\'s features. For example, performance cookies collect information about how you use the site, such as the pages you visit most often, allowing us to provide you with targeted and relevant options that enhance your browsing and usage experience on the site .';
  static String privacyPolicyAr10 =
      'نعم، وسيضع النظام الخاص بنا ملفات تعريف الارتباط عند تسجيل الدخول إلى الموقع وهذا لضمان تجربة ممتعة وسلسة للمستخدم عبر الموقع ، يمكنك إلغاء تفعيل ملفات تعريف الارتباط عن طريق تغيير إعدادات المتصفح ، وفي حال إلغاء التفعيل لملفات تعريف الارتباط، سيؤثر ذلك على كيفية عمل موقعنا وربما لن تكون قادراً على الوصول إلى أو استخدام بعض أو جميع الوظائف في الموقع. على سبيل المثال: تجمع ملفات تعريف الارتباط الخاصة بالأداء معلومات حول كيفية استخدامك للموقع مثل الصفحات التي تزورها في معظم الأوقات مما يسمح لنا بتزويدك بالخيارات المستهدفة وذات الصلة التي تعزز تجربة تصفحك واستخدامك للموقع .';

  static String privacyPolicyHeaderEn11 = 'What if we change our privacy policy?';
  static String privacyPolicyHeaderAr11 = 'ماذا لو غيرنا سياسة الخصوصية الخاصة بنا ؟ :';
  static String privacyPolicyEn11 =
      'Our business undergoes continuous changes, so our privacy policy may be affected and require corresponding adjustments. We will publish the current version of this privacy policy on the website, and it will remain effective from the date of publication on the website or as determined by us as the effective date .'
      '\nWe may periodically send reminder messages via email about our notifications and terms, but you should verify by visiting our site frequently to review the latest changes.'
      '\nYou should regularly check the privacy policy. Your continued use of the site after any changes constitutes your acceptance of this privacy policy in its modified form.';
  static String privacyPolicyAr11 =
      'يتعرض عملنا لتغييرات بصفة مستمرة، لذا قد تتأثر سياسة الخصوصية الخاصة بنا وتحتاج إلى تغيير موازٍ، سوف نقوم بنشر النسخة الحالية لسياسة الخصوصية هذه على الموقع وستظل سارية المفعول منذ نشرها على الموقع أو بناءً على الموعد الذي نحدده من جانبنا كـتاريخ لسريانها.'
      '\nقد نقوم بإرسال رسائل تذكيرية بصفة دورية عبر البريد الإلكتروني بإخطاراتنا وشروطنا، ولكن ينبغي لك التحقق بزيارتك المتكررة لموقعنا للاطلاع على أحدث التغييرات.'
      '\nيجب عليك التحقق من سياسة الخصوصية بصورة منتظمة ، فإن استمرارك في استخدام الموقع بعد أي تغييرات يُعد موافقة منك على سياسة الخصوصية هذه بصيغتها المعدلة';

  static String privacyPolicyHeaderEn12 = 'To contact us:';
  static String privacyPolicyHeaderAr12 = 'للتواصل معنا :';
  static String privacyPolicyEn12 =
      'If you have any inquiries regarding the privacy policy, you can contact us through any of the following methods:'
      '\nEmail :  info@saayer.com'
      '\nCustomer Service: +966552061645';
  static String privacyPolicyAr12 =
      'إن كانت لديك أية استفسارات بخصوص سياسة الخصوصية، فيمكنك التواصل معنا عبر أي من طرق التواصل التالية:'
      '\nالبريد الإلكتروني : info@saayer.com'
      '\nخدمة العملاء : +966552061645';

  /// Terms Conditions
  static String termsConditionsEn1 =
      'The terms and conditions of use for the website www.saayer.com (referred to as "the website" or "the platform" or "Saayer platform" or "Saayer app"), operated and owned by Saayer Solutions for Information Technology, registered in accordance with the relevant provisions of the Companies Law of the Kingdom of Saudi Arabia (referred to as "Saayer platform" or "we" or "us"), providing logistic services to you as a consumer (referred to as "you" or "the user" or "your" or "the customer"). Your browsing or accessing the website constitutes your agreement, personally or on behalf of the company you represent ("you" or "your"), to comply with all the following terms and conditions to avail the services available before registering your account on the Saayer platform. You acknowledge that you have read, understood, and agreed to all the terms, conditions, and usage policies. If you reject or do not accept them, you are not entitled to use the website, its services, or the app, and you must immediately cease registering on the website';
  static String termsConditionsAr1 =
      'تسري أحكام و شروط استخدام الموقع على استخدامك لموقع www.saayer.com ، (يُشار إليه بـ"بالموقع الإلكتروني " او" الموقع" او"منصة ساير"او"تطبيق ساير") الذي تديره وتملكه مؤسسة حلول ساير لتقنية المعلومات وهي مسجلة حسب الأصول وفقًا للأحكام ذات الصلة لقانون الشركات بالمملكة العربية السعودية ( يشار اليها "منصة ساير" او " نحن " او الضمير " نا " ) والتي تقدم خدمات لوجستية اليك كمستهلك (والتي قد نشير اليك بكلمات " انت " او " المستخدم " او " الخاص بك " او " العميل") إن تصفحك أو دخولك الموقع الإلكتروني هو موافقةً منك، بصفتك الشخصية و/أو بالنيابة عن الشركة التي تمثلها ("أنت" أو "الخاص بك") ويشترط موافقتك على جميع الشروط والاحكام الآتية للاستفادة من الخدمات المتوفرة قبل تسجيل حسابك في منصة ساير وتقر انك قرأت وفهمت و وافقت على جميع الشروط والاحكام وسياسات الاستخدام وفي حال رفضك او عدم قبولك لها فلا يحق لك استخدام الموقع الالكتروني ولا الخدمات ولا التطبيق وعليك التوقف عن التسجيل في الموقع فورا .';

  static String termsConditionsEn2 =
      'We reserve the right to make changes or modifications to these terms and conditions and privacy policy at any time.'
      '\nAny amendments will become effective immediately upon being published on the platform. By continuing to use this website or the app and/or the services, you understand and agree to these modifications or changes. If you do not agree to any changes or modifications, you may terminate your account. It is your responsibility to regularly review the terms, conditions, and privacy policy, as any updates will be posted on this platform.';
  static String termsConditionsAr2 =
      'حتفظ بحقنا في إجراء تغييرات أو تعديلات على أحكام وشروط وسياسة الخصوصية هذه في أي وقت. ستصبح أي تعديلات سارية فور نشرها على المنصة و باستمرار استخدامك لهذا الموقع الإلكتروني أو التطبيق و/أو الخدمات، فإنك تفهم وتوافق على هذه التعديلات أو التغييرات و إذا كنت غير موافق على أي تغييرات أو تعديلات، يُمكنك إنهاء حسابك عليك مراجعة الشروط والأحكام وسياسة الخصوصية بشكل دوري، حيث يتم نشر أي تحديثات لها على هذه المنصة .';

  static String termsConditionsHeaderEn3 = 'First: Intellectual Property Rights:';
  static String termsConditionsHeaderAr3 = 'اولا : حقوق الملكية الفكرية :';
  static String termsConditionsEn3 =
      '1. All intellectual property rights to the content on our website (Saayer platform) and Saayer application are owned by us and protected under copyright, trademark, and other applicable laws. This includes texts, graphics, logos, button icons, images, software, clips, interfaces, code, and modifications.'
      '\n2. By agreeing to use the website, you agree that all rights are reserved for the Saayer platform, and you are not permitted to modify, copy, reproduce, distribute, create derivative works, display, or exploit them in any form without prior written consent from the Saayer platform.'
      '\n3. Trademarks and logos are owned by us, and copying or reproducing any part of the platform or application is not allowed without our written consent.'
      '\n4. The use of robots or data extraction tools to access the website or services is prohibited, and we reserve the right to restrict or terminate your access to the platform and application at any time if you violate any terms of use or for any other reason without prior notice. Termination or restriction of your access to the platform and application or your use of it shall not constitute a waiver of our rights under the law.';
  static String termsConditionsAr3 =
      '1- كل حقوق الملكية الفكرية للمحتوى على موقعنا الإلكتروني ( منصة ساير ) وتطبيق ساير هي ملك لنا ومحمية بموجب قوانين التأليف والنشر والعلامات التجارية ويشمل ذلك النصوص والأشكال الرسومية والشعارات وأيقونات الأزرار والصور والبرمجيات والمقاطع والواجهات والتعليمات البرمجية والتحويلات البرمجية'
      '\n.2- بالموافقة على استخدام الموقع فإنك توافق على أن جميع الحقوق محفوظة لمنصة ساير ولا يُسمح لك بتعديل أو نسخ أو إعادة إنتاج أو توزيع أو إنشاء أعمال مشتقة أو عرضها أو استغلالها بأي شكل من الأشكال دون موافقة خطية من منصة ساير.'
      '\n3- العلامة التجارية والشعارات تعتبر ملكًا لنا وأن نسخ أو إعادة إنتاج أي جزء من المنصة او التطبيق غير مسموح به بدون موافقة خطية منا .'
      '\n4- يُمنع استخدام الروبوتات أو أدوات استخراج البيانات للوصول إلى الموقع أو الخدمات و نحتفظ بحقنا في تقييد أو إنهاء وصولك إلى المنصة والتطبيق في أي وقت إذا انتهكت أحد شروط الاستخدام أو لأي سبب آخر دون إشعار مسبق ولا يُعَد إنهاء أو تقييد وصولك إلى المنصة والتطبيق أو استخدامك له تنازلاً عن  حقوقنا بمقتضى القانون .';

  static String termsConditionsHeaderEn4 = 'Second: Service Providers';
  static String termsConditionsHeaderAr4 = 'ثانيا : مزودي الخدمة';
  static String termsConditionsEn4 =
      '1. We are not a transportation or shipping company, but rather an electronic platform that offers special discounts from shipping companies and connects them with users, whether they are individual traders or companies.'
      '\n2. We would like to clarify that we are not responsible for any errors or negligence that may occur by shipping companies or their employees. Although there is no guarantee regarding the timing or quality of the services provided by shipping companies, we are committed to making every effort on our part to support you in case of any issues while dealing with the chosen company.';
  static String termsConditionsAr4 =
      '1- نحن لسنا شركة نقل أو شحن، بل نمثل منصة إلكترونية تقدم خصمًا خاصًا من شركات شحن وتربط بينها وبين المستخدمين، سواء كانوا تجارًا أفرادًا أو شركات.'
      '\n2- نود أن نوضح أننا غير مسؤولين عن أي أخطاء أو سهو قد يحدث من قبل شركات الشحن أو موظفيها. على الرغم من عدم وجود ضمان بشأن توقيت أو جودة الخدمات التي تقدمها شركات الشحن، إلا أننا ملتزمون ببذل أقصى جهد من جانبنا لدعمك في حالة وجود أي مشكلات أثناء التعامل مع الشركة التي اخترتها.';
  static String termsConditionsColoredEn4 =
      'We advise the customer, before issuing the shipping policy, to review and understand the terms and conditions set by the shipping company they have chosen on its website. By doing so, the customer expresses their consent and commitment to those terms.';
  static String termsConditionsColoredAr4 =
      'ننصح العميل قبل إصدار بوليصة الشحن بمراجعة وفهم الشروط والأحكام التي تحددها شركة الشحن التي اختارها على موقعها الإلكتروني. بهذه الخطوة، يعبّر العميل عن موافقته والتزامه بتلك الشروط.';

  static String termsConditionsHeaderEn5 = 'Third: Registration on the Saayer Platform';
  static String termsConditionsHeaderAr5 = 'ثالثا : التسجيل في منصة ساير';
  static String termsConditionsEn5 =
      '1. When you register on the Saayer platform, you agree to provide us with accurate, truthful, and up-to-date personal data about yourself as required in the registration form. The process of collecting registration data and other information is subject to our privacy policy.'
      '\n2. We reserve the right to terminate services and suspend your account if there is any breach or violation of our terms or the terms of the service provider, with the possibility of taking legal action against you.'
      '\n3. We may disclose your data to security or judicial authorities if requested without referring back to you.'
      '\n4. We may use some of your data, such as email and phone number, to send registration codes or login codes, as well as to send promotional notifications or marketing materials, and also to handle any financial claims.'
      '\n5. You are responsible for maintaining the confidentiality of your login information, password, and account, as well as for all activities that occur within your account or login.';
  static String termsConditionsAr5 =
      '1- عندما تقوم بالتسجيل في منصة ساير ،فإنك توافق على تزويدنا ببيانات شخصية صحيحة ودقيقة ومحدثة عنك كما هو مطلوب في نموذج التسجيل و تخضع عملية جمع بيانات التسجيل والمعلومات الأخرى ومعالجتها لسياسة الخصوصية الخاصة بنا.'
      '\n2- نحتفظ بالحق في إنهاء الخدمات وتعليق حسابك إذا كان هناك خرق أو انتهاك لأحد شروطنا أو شروط مزود الخدمة مع إمكانية اتخاذ إجراءات قانونية ضدك.'
      '\n3- قد نفصح عن بياناتك للجهات الأمنية او القضائية في حال طلبت منا ذلك دون الرجوع لك .'
      '\n4- قد نستخدم بعض بياناتك، مثل البريد الإلكتروني ورقم الهاتف، لإرسال رمز التسجيل أو رمز الدخول، وكذلك لإرسال إشعارات ترويجية أو مواد تسويقية، وأيضًا للتعامل مع أي مطالبات مالية.'
      '\n5- أنت مسؤول عن الحفاظ على سرية معلومات تسجيل الدخول وكلمة المرور والحساب الخاص بك، كما أنك مسؤول عن جميع الأنشطة التي تحدث داخل حسابك أو تسجيل الدخول الخاص بك.';

  static String termsConditionsHeaderEn6 = 'Fourth: Cancellation and Refund of Fees';
  static String termsConditionsHeaderAr6 = 'رابعا : الإلغاء واسترجاع الرسوم';
  static String termsConditionsEn6 =
      '1 Customers have the right to cancel the shipping policy within five days maximum from the date of issuance of the policy, provided that it has not been delivered to the shipping company.'
      '\n2 Customers have the right to cancel the shipping policy and receive a refund of its value if the shipment has not been delivered to the shipping company, and the amount will be refunded to the customer.'
      '\n3 Shipping companies do not accept the return of shipping policy fees if they have received the policy from the customer and processed it.'
      '\n4 these companies may allow the issuance of a new policy and payment of new fees, allowing for the replacement of the previous policy with the new one.';
  static String termsConditionsAr6 =
      '1- يحق للعميل الغاء بوليصة الشحن قبل تسليمها لشركة الشحن خلال خمسة ايام بحد اقصى من تاريخ إصدار البوليصة .'
      '\n2- يحق للعميل إلغاء بوليصة الشحن واسترداد قيمتها مالم يتم تسليم الشحنة لشركة الشحن وسيتم إعادة المبلغ للعميل .'
      '\n3- شركات الشحن لا تقبل بإعادة رسوم بوليصة الشحن في حال استلمت البوليصة من العميل وتم التعامل معها .'
      '\n4- تتيح هذه الشركات إمكانية إصدار بوليصة جديدة ودفع رسوم جديدة، مما يتيح استبدال البوليصة السابقة بالجديدة .';

  static String termsConditionsHeaderEn7 = 'Fifth: Shipping Restrictions and Responsibilities';
  static String termsConditionsHeaderAr7 = 'خامسا : قيود ومسؤوليات الشحن';
  static String termsConditionsEn7 =
      '1- You agree to ensure that shipments handled by the shipping company you have chosen through the Saayer platform do not contain anything that cannot be safely or legally transported or anything prohibited by any law or regulation, including but not limited to alloys, currency, hazardous shipments, flammable materials, narcotics, negotiable instruments in bearer form such as checks/drafts payable to bearer, cash, promissory notes, bonds payable to bearer, certificates payable to bearer, stamps, open-end traveler\'s checks, credit cards, or SIM cards.'
      '\n2- In the event that a shipment handled by the shipping company through the Sayer platform under this agreement involves any of the procedures mentioned above, the customer undertakes to defend the shipping company and the Sayer platform and its directors, employees, representatives, and beneficiaries of the service provider, and indemnify them for any damages, all costs, claims, or liabilities, including reasonable attorney\'s fees, incurred by any of the beneficiaries of the service provider or the Saayer platform arising from or related to the customer\'s breach of the obligations herein.'
      '\n3- You acknowledge and agree that Saayer platform does not inspect, receive, or package your shipments, and Saayer platform shall not be liable for the decisions made and executed by you through the services of the Saayer platform, and you are responsible for your shipments and their contents.'
      '\n4- Saayer platform shall in no event be liable for any indirect, incidental, special, or consequential damages, or damages for loss or damage of shipments, and we urge you again to review and understand the terms of the shipping company you have chosen.';
  static String termsConditionsAr7 =
      '1- انت تتعهد بضمان ألا تحتوي الشحنات التي تتعامل معها شركة الشحن التي اخترتها من خلال منصة ساير على أي شيء لا يمكن نقله بشكل آمن أو قانوني او أي شيء محظور بموجب أي قانون أو لائحة ؛ على سبيل المثال لا للحصر السبائك والعملة والشحنات الخطرة والمواد القابلة للاحتراق والمخدرات، او الصكوك القابلة للتداول في شكل لحاملها مثل الشيكات/ المسودات لحاملها أو الحوالات النقدية أو السندات الاذنية أو سندات لحاملها أو شهادات لحاملها أو الطوابع أو التذا كر المفتوحة أو شيكات المسافرين غير المصنفة أو بطاقات الائتمان أو بطاقات SIM.'
      '\n2- في حالة أن تتضمن شحنة تتعامل معها شركة الشحن ومن خلال منصة ساير بموجب هذه الاتفاقية أيًا من الاجراءات المذكورة أعلاه، يتعهد العميل بالدفاع عن شركة الشحن وعن منصة ساير ومسؤوليها ومديريها وموظفيها وممثليها ومستفيدي مزود الخدمة ومنصة ساير وتعويضهم عن أي ضرر وجميع الاضرار أو التكاليف أو المطالبات أو الالتزامات، بما في ذلك أتعاب المحاماة المعقولة، التي يتكبدها أي من مستفيدي مزود الخدمة او منصة ساير الناشئة عن أو المتعلقة بخرق العميل للالتزامات الواردة هنا'
      '\n3- أنت تقر وتعترف أن منصة ساير لا تقوم بفحص او استلام او تغليف شحناتك ولا تتحمل منصة ساير أي مسؤولية عن القرارات التي تتخذها انت وتنفذها من خلال خدمات منصة ساير وانك المسؤول عن شحناتك وما تحتويه .'
      '\n4- لن تتحمل منصة ساير بأي حال من الأحوال المسؤولية عن أي أضرار غير مباشرة وعرضيه أو خاصة أو تبعية، أو أضرار عن فقدان أو تلف الشحنات وندعوك مجددا بمراجعة وفهم شروط شركة الشحن التي اخترتها .';

  static String termsConditionsHeaderEn8 = 'Sixth: Shipment Weight';
  static String termsConditionsHeaderAr8 = 'سادسا : وزن الشحنة';
  static String termsConditionsEn8 =
      '1- You must know and understand that there are what is called actual weight and dimensional weight. The shipping company determines the shipping cost based on the greater weight, whether actual (obtained by placing the shipment on a scale) or dimensional (calculated by multiplying the length × width × height of the package in centimeters and dividing the result by 5000 for international shipping and 4000 for domestic shipping, and the result is the dimensional weight) .'
      '\n2- We emphasize recording the correct actual weight and also accurately measuring and recording the dimensions of the shipment in the shipping policy, and dimensional weight will be automatically calculated.'
      '\n3- You understand that the shipping company re-weighs the shipment and verifies the correct weight, and it adopts the higher weight, whether actual or dimensional. In case of an increase in weight, you are obligated to pay the additional weight fees.';
  static String termsConditionsAr8 =
      '1- يجب ان تعرف وتفهم ان هناك ما يسمى بالوزن (الفعلي او القائم ) والوزن ( الحجمي او البعدي) فشركة الشحن تضع سعر الشحن بناء على الوزن  الأكبر سواء الفعلي (الذي يتم الحصول عليه مـن وضـع الشــحنة على الميزان)، والوزن الحجمي ( الـذي يتم حسـابه بضـرب الطول × العرض× الارتفاع للحزمة بالسنتيمتر) وقسمة الناتج على 5000 للشحن الدولي و  4000 للمحلي والناتج هو الوزن الحجمي.'
      '\n2- نشدد على تسجيل الوزن الفعلي الصحيح وأيضا قياس وتسجيل ابعاد الشحنة بدقة في بوليصة الشحن وسيتم احتساب الوزن الحجمي بشكل آلي .'
      '\n3- انت تفهم ان شركة الشحن تقوم بإعادة وزن الشحنة والتأكد من الوزن الصحيح وتعتمد الوزن الأعلى سواء الفعلي او الحجمي وفي حال تبين زيادة في الوزن تكون ملزم بدفع رسوم الوزن الزائد .';

  static String termsConditionsHeaderEn9 = 'Seventh: International Shipping';
  static String termsConditionsHeaderAr9 = 'سابعا : الشحن الدولي';
  static String termsConditionsEn9 =
      '1- The customer is responsible for paying any customs duties, fees, taxes, or applicable charges on the services before the shipping company releases the shipment and/or shipping documents. If the shipping company pays any customs duties and/or value-added tax on importation on behalf of the customer, the customer is responsible for paying these customs duties and/or value-added tax on importation to the shipping company immediately upon receipt of the customer and invoices for these payments from the shipping company.'
      '\n2- This clause also applies to shipments that are returned to the customer/sender for any reason, such as being undeliverable or refused by the recipient.';
  static String termsConditionsAr9 =
      '1- يلتزم العميل بدفع أي رسوم جمركية و/ أو أجور و/ أو ضرائب و/او عمولات مطبقة أو خاضعة على الخدمات وذلك قبل قيام شركة الشحن بالإفراج عن الشحنة و/ أو وثائق الشحن في حال قامت شركة الشحن بتسديد أي رسوم جمركية و/أو رسوم ضريبة القيمة المضافة على الاستيراد نيابة عن العميل و يكون العميل مسؤول عن دفع هذه الرسوم الجمركية و/ أو رسوم ضريبة القيمة المضافة على الاستيراد إلى شركة الشحن فورا بعد استلام العميل وصولات هذه الدفعات من قبل شركة الشحن .'
      '\n2- تطبق هذه الفقرة أيضا على الشحنات التي يتم إرجاعها إلى العميل/ ُمرسل الشحنة حسب الحالة لأي سبب كان مثل (غير قابلة للتسليم أو مرفوضة من قبل المرسل إليه).';

  static String termsConditionsHeaderEn10 = 'Eighth: Sending and Receiving Shipments';
  static String termsConditionsHeaderAr10 = 'ثامنا : ارسال و استلام الشحنات  ';
  static String termsConditionsEn10 =
      '1- The times for receiving shipments are subject to the schedules and terms of the shipping companies, which determine the appropriate time for receiving the shipment. Some companies do not accept less than five shipments from a customer and may impose additional fees for receiving them. This varies from one company to another.'
      '\n2- Once the customer provides the sender\'s and recipient\'s information during the issuance of the shipping policy, the customer implicitly agrees to allow the shipping company to use this information for shipping purposes and to fulfill its obligations under the shipping policy and the agreed-upon terms and conditions. This also implies the customer\'s implicit consent to share this information with the shipping company and its subsidiaries, branches, and agents. Once the customer provides personal information to the shipping company and issues the shipping policy, the customer implicitly agrees to the transfer and use of their personal information and that of the recipient in other countries in the case of international shipping.'
      '\n3- After issuing the shipping policy and handing it over to the carrier, Saayer platform does not bear any fees or expenses resulting from changes in information by you (for example, changing the address, canceling the order, or recalling the request).'
      '\n4- The acceptance by the shipping company of a specific shipment does not imply that this shipment complies with applicable laws or regulations or that it complies with current terms.'
      '\n5- The shipping company will attempt the first delivery, and if the customer does not respond, it will attempt, on its own initiative or at the customer\'s request, to redeliver in the future. In the event of a failed delivery, the shipping company may, at its discretion, return the shipment to the nearest service center for the customer or the sender, which may result in additional fees. Each shipping company has its own policy in such cases.'
      '\n6- The customer is responsible for adequate and sufficient packaging of the shipment in a suitable manner for transportation, and neither the shipping company nor the Saayer platform will be responsible for any damage to the shipment due to improper packaging by the customer.';
  static String termsConditionsAr10 =
      '1- تخضع أوقات استلام الشحنات لأوقات شركات الشحن وشروطها وهي من تعرض الوقت المناسب لإستلام الشحنة وبعض الشركات لا تستلم من العميل اقل من خمسة شحنات وقد تفرض رسوم إضافية للإستلام و يختلف ذلك من شركة إلى أخرى .'
      '\n2- بمجرد تقديم معلومات و بيانات المرسل والمستلم من قبل العميل أثناء إصدار بوليصة الشحن فإنه يوافق ضمنياً على استخدام شركة الشحن لهذه المعلومات و البيانات لأغراض الشحن ولأداء التزاماتها بموجب بوليصة الشحن و الشروط و الأحكام المتفق عليها، كما تعني أيضاً موافقة العميل ضمنياً على مشاركة شركة الشحن لهذه المعلومات والبيانات الخاصة به و بالمستلم مع الشركات التابعة لها و فروعها و وكلائها، كما أنه بمجرد تقديم العميل للمعلومات و البيانات الشخصية إلى شركة الشحن وإصدار بوليصة الشحن، فإن العميل يوافق ضمنياً على نقل و استخدام المعلومات و البيانات الشخصية الخاصة به و بالمستلم في بلدان أخرى في حالة الشحن الدولي .'
      '\n3- بعد إصدار بوليصة الشحن وتسليمها للناقل فإن منصة ساير لا تتحمل أي رسوم أو مصاريف ناتجة عن تغيير المعلومات من جانبك (على سبيل المثال، تغيير العنوان، أو إلغاء الطلب، أو استدعاء الطلب).'
      '\n4- قبول شركة الشحن لشحنة معينة لا يعني أن هذه الشحنة متوافقة مع القوانين أو الأنظمة المطبقة أو أنها مطابقة للشروط الحالية.'
      '\n5- ستقوم شركة الشحن بمحاولة التسليم الأولى وعند عدم تجاوب العميل ستحاول من تلقاء نفسها أو بناءً على طلب العميل إعادة محاولة التسليم في المستقبل، وفي حال فشل التسليم يحق لشركة الشحن وفقاً لتقديرها إعادة الشحنة لأقرب مركز خدمة للعميل أو للمرسل وقد يترتب على ذلك فرض رسوم إضافية ولكل شركة شحن سياستها الخاصة في مثل هذه الحالة .'
      '\n6- يجب أن يكون العميل مسؤولاً عن التعبئة المناسبة والكافية للشحنة بطريقة مناسـبة للنقل، ولن تكون شركة الشحن او منصة ساير مسؤولان عن أي ضرر يلحق بالشحنة بسبب التغليف غير المناسب مـن قبل العميل.';

  static String termsConditionsHeaderEn11 = 'Ninth: Neglected, Abandoned, or Returned Shipments';
  static String termsConditionsHeaderAr11 = 'تاسعا : الشحنات المهملة أو المتروكة او المعادة';
  static String termsConditionsEn11 =
      '1- Procedures, policies, and terms vary from one company to another, and we emphasize the importance of reviewing and reading the terms and conditions of the shipping company you have chosen.'
      '\n2- By agreeing to proceed with the service request, you fully agree to these terms and conditions and are bound by them';
  static String termsConditionsAr11 =
      '1- تتفاوت الإجراءات والسياسات والشروط من شركة إلى أخرى ونؤكد ونكرر على ضرورة مراجعة وقراءة الشروط والأحكام لشركة الشحن التي اخترتها.'
      '\n2- بالموافقة على متابعة طلب الخدمة، فإنك توافق على هذه الشروط والأحكام بشكل كامل وملتزم بها.';

  static String termsConditionsHeaderEn12 = 'Tenth: Fees and Pricing';
  static String termsConditionsHeaderAr12 = 'عاشرا : الرسوم والاسعار';
  static String termsConditionsEn12 =
      '1- Registration on the Saayer platform is free of charge and allows the customer to benefit from some services such as issuing shipping policies and using a customer-specific dashboard.'
      '\n2- Subscription fees for packages may be imposed, and these will be announced on the website and the application in the future.'
      '\n3- Saayer platform imposes fees for issuing shipping policies, and prices vary from one company to another.'
      '\n4- Saayer platform reserves the right to add, increase, decrease, or discount any fees for any users regardless of the reason for their registration.'
      '\n5- Saayer platform has the right to issue or suspend promotional codes, promotional offers, marketing offers, or discounts at any time as needed.';
  static String termsConditionsAr12 =
      '1- التسجيل في منصة ساير يكون بشكل مجاني، ويتيح للعميل الاستفادة من بعض الخدمات مثل إصدار بوليصة الشحن واستخدام لوحة تحكم خاصة بالعميل.'
      '\n2- قد تفرض رسوم اشتراك في الباقات والتي سيتم الإعلان عنها مستقبلا  في الموقع والتطبيق .'
      '\n3- منصة ساير تفرض رسوم إصدار بوليصة الشحن وتختلف الأسعار من شركة الى أخرى.'
      '\n4- تحتفظ منصة  ساير بحقها في إضافة او زيادة او خفض او خصم أي رسوم على أي من المستخدمين أيا كان سبب تسجيلهم .'
      '\n5- منصة ساير لها الحق في إصدار او إيقاف الأكواد الترويجية او العروض الترويجية او التسويقية او الخصومات في أي وقت متى ما دعت الحاجة لذلك.';

  static String termsConditionsHeaderEn13 = 'the language :';
  static String termsConditionsHeaderAr13 = 'اللغة :';
  static String termsConditionsEn13 = 'The Arabic text is the final interpreter of this agreement.'
      '\n\nAccording to the rules, terms, and conditions of this User Agreement, in case of a dispute, it shall be resolved through reconciliation, negotiations, or amicable settlement. If the dispute persists, it shall be settled through the competent authorities in the Kingdom of Saudi Arabia.';
  static String termsConditionsAr13 = 'يجب أن يكون النص باللغـة العربية هو المفسـر النهائي لهذه الاتفاقية.'
      'بموجب قواعد وشروط وأحكام اتفاقية الاستخدام هذه فإنه في حال النزاع فيتم حل الخلاف عن طريق التوفيق والمفاوضات أو التسوية الودية، وفي حال استمرار الخلاف فيتم حله عن طريق السلطات المختصة بالمملكة العربية السعودية\n\n .';
}
