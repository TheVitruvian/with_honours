# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.delete_all
Question.delete_all
Answer.delete_all
Company.delete_all
University.delete_all


user1 = User.create!(user_name: "Neha", first_name: "Neha", profile_picture: nil, role: 'admin', email: "nehaasdf@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1" )
user2 = User.create!(user_name: "Jamie", first_name: "Jamie", profile_picture: nil, role: 'admin', email: "jamjam@jam.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
user3 = User.create!(user_name: "Alex", first_name: "Alex", profile_picture: nil, role: 'admin', email: "alexham100@aol.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
user4 = User.create!(user_name: "Adam", first_name: "Adam", profile_picture: nil, role: 'user', email: "adambwdi@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
user5 = User.create!(user_name: "AlexF", first_name: "AlexF", profile_picture: nil, role: 'user', email: "fakealexf@fakealexf.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

company1 = Company.create!(user_name: "General Assembly", email: "ga@ga.com", password: "password")

question1 = Question.create!(hotness: 0, category: 'Marketing' ,owner_type: "user", title: "How to market a 'difficult' product/service?", content: 'What first steps would you take when needing to communicate a sensitive or controversial service/product to the public?', image: 'placeholder')
question2 = Question.create!(hotness: 0, category: 'General', owner_type: "company", title: "Overcoming conflict...", content: 'Key members of your senior team disagree about your companies brand identity - how do you help them come to a mutual decision?', image: 'placeholder')
question3 = Question.create!(hotness: 0, category: 'Marketing', owner_type: "user", title: "Marketing in a vacuum...", content: "Your company wants to launch a new service at short notice. You've been given very little background on the service itself. What do you do first?", image: 'placeholder')
question4 = Question.create!(hotness: 0, category: 'Communications', owner_type: "company", title: "Communication strategy", content: 'What do you think the main elements to consider when writing an annual marketing/communications strategy?', image: 'placeholder')
question5 = Question.create!(hotness: 0, category: 'Communications', owner_type: "user", title: "What impact has social media had on Government communications?", content: '', image: 'placeholder')
question6 = Question.create!(hotness: 0, category: 'Communications', owner_type: "user", title: "Crisis management", content: 'The new CEO of the British Business Bank (who has been hired by BIS) has been accused of (insert any possible crimes). How will the Department minimise its reputational risk in hiring this man/woman?', image: 'placeholder')
question7 = Question.create!(hotness: 0, category: 'General', owner_type: "user", title: "How would you deal with a peer who steels?", content: "Its your first week in a new job as a customer services rep in a busy retail store and you think that you've spotted that a colluge is stealing low value items that your store sells. How would you go about dealing with the situation?", image: 'placeholder')
question8 = Question.create!(hotness: 0, category: 'Consulting', owner_type: "user", title: "What makes the 'perfect' pitch?", content: "You've got a big pitch tomorrow for a major account. You partner wants you to lead. What elements do you need to think about when pitching?  What are the pitfalls of looking too polished? What are the major no nos?", image: 'placeholder')

answer1 = Answer.create!(owner_type: "company", content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vel sodales magna. Mauris pretium odio in neque laoreet, eget porta erat commodo. Curabitur sit amet semper mi. Integer tempor diam eget libero aliquam, vel placerat nibh porttitor. Aliquam erat volutpat. Fusce tincidunt euismod malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas congue diam quis elit dictum, ac convallis mi ultrices.

Nulla quis ligula luctus, lacinia massa consectetur, congue elit. Vestibulum aliquet pharetra justo, sed tristique tellus imperdiet id. Nunc sit amet purus vel leo hendrerit malesuada. Vivamus gravida massa in augue dignissim, nec tincidunt sapien malesuada. Vestibulum vitae nisi vel arcu blandit mattis a a arcu. Fusce dignissim dui eu lacus facilisis ultrices. Nulla a risus quis nulla scelerisque pellentesque at at dolor. Donec suscipit ac tortor ut lacinia. Ut faucibus vehicula suscipit. Nullam dapibus pretium dolor, et sagittis odio. Maecenas non convallis magna, sit amet dignissim justo. Vivamus adipiscing laoreet porta. Aliquam tortor lacus, ornare eu luctus vitae, rutrum ut turpis. Praesent quis nibh nec nibh auctor placerat vel at diam. Fusce rhoncus nulla eu mi interdum vehicula. Maecenas ultricies neque ut libero hendrerit imperdiet.

Vestibulum at pharetra magna, sed gravida enim. Curabitur ante purus, vehicula vel mauris sit amet, scelerisque tincidunt lacus. Nam malesuada imperdiet nisl. Integer rhoncus ligula consequat ligula mollis feugiat. Ut feugiat elementum pharetra. Suspendisse nisi enim, pellentesque vitae congue sit amet, vulputate eu lectus. Nulla in metus nec sem consequat interdum id et diam.

Sed malesuada tortor quis ligula lacinia porttitor. Donec sodales eget nulla at mattis. Nam commodo nisi sit amet arcu pharetra, eu rutrum sem aliquam. Curabitur vel metus justo. Sed quis turpis erat. Nulla accumsan neque viverra tortor commodo, a condimentum lacus faucibus. Suspendisse elit dui, ullamcorper ut ornare a, molestie eu ligula.

Duis viverra molestie urna condimentum auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse potenti. Aenean eu massa erat. Mauris quis arcu vel ligula iaculis porta. Aenean vel augue eget lorem semper pretium. Proin non sapien nisi. Vivamus et sagittis tellus. Vivamus eget eleifend lectus.

')
answer2 = Answer.create!(owner_type: "user", content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vel sodales magna. Mauris pretium odio in neque laoreet, eget porta erat commodo. Curabitur sit amet semper mi. Integer tempor diam eget libero aliquam, vel placerat nibh porttitor. Aliquam erat volutpat. Fusce tincidunt euismod malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas congue diam quis elit dictum, ac convallis mi ultrices.

Nulla quis ligula luctus, lacinia massa consectetur, congue elit. Vestibulum aliquet pharetra justo, sed tristique tellus imperdiet id. Nunc sit amet purus vel leo hendrerit malesuada. Vivamus gravida massa in augue dignissim, nec tincidunt sapien malesuada. Vestibulum vitae nisi vel arcu blandit mattis a a arcu. Fusce dignissim dui eu lacus facilisis ultrices. Nulla a risus quis nulla scelerisque pellentesque at at dolor. Donec suscipit ac tortor ut lacinia. Ut faucibus vehicula suscipit. Nullam dapibus pretium dolor, et sagittis odio. Maecenas non convallis magna, sit amet dignissim justo. Vivamus adipiscing laoreet porta. Aliquam tortor lacus, ornare eu luctus vitae, rutrum ut turpis. Praesent quis nibh nec nibh auctor placerat vel at diam. Fusce rhoncus nulla eu mi interdum vehicula. Maecenas ultricies neque ut libero hendrerit imperdiet.

Vestibulum at pharetra magna, sed gravida enim. Curabitur ante purus, vehicula vel mauris sit amet, scelerisque tincidunt lacus. Nam malesuada imperdiet nisl. Integer rhoncus ligula consequat ligula mollis feugiat. Ut feugiat elementum pharetra. Suspendisse nisi enim, pellentesque vitae congue sit amet, vulputate eu lectus. Nulla in metus nec sem consequat interdum id et diam.

Sed malesuada tortor quis ligula lacinia porttitor. Donec sodales eget nulla at mattis. Nam commodo nisi sit amet arcu pharetra, eu rutrum sem aliquam. Curabitur vel metus justo. Sed quis turpis erat. Nulla accumsan neque viverra tortor commodo, a condimentum lacus faucibus. Suspendisse elit dui, ullamcorper ut ornare a, molestie eu ligula.

Duis viverra molestie urna condimentum auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse potenti. Aenean eu massa erat. Mauris quis arcu vel ligula iaculis porta. Aenean vel augue eget lorem semper pretium. Proin non sapien nisi. Vivamus et sagittis tellus. Vivamus eget eleifend lectus.

')
answer3 = Answer.create!(owner_type: "company", content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vel sodales magna. Mauris pretium odio in neque laoreet, eget porta erat commodo. Curabitur sit amet semper mi. Integer tempor diam eget libero aliquam, vel placerat nibh porttitor. Aliquam erat volutpat. Fusce tincidunt euismod malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas congue diam quis elit dictum, ac convallis mi ultrices.

Nulla quis ligula luctus, lacinia massa consectetur, congue elit. Vestibulum aliquet pharetra justo, sed tristique tellus imperdiet id. Nunc sit amet purus vel leo hendrerit malesuada. Vivamus gravida massa in augue dignissim, nec tincidunt sapien malesuada. Vestibulum vitae nisi vel arcu blandit mattis a a arcu. Fusce dignissim dui eu lacus facilisis ultrices. Nulla a risus quis nulla scelerisque pellentesque at at dolor. Donec suscipit ac tortor ut lacinia. Ut faucibus vehicula suscipit. Nullam dapibus pretium dolor, et sagittis odio. Maecenas non convallis magna, sit amet dignissim justo. Vivamus adipiscing laoreet porta. Aliquam tortor lacus, ornare eu luctus vitae, rutrum ut turpis. Praesent quis nibh nec nibh auctor placerat vel at diam. Fusce rhoncus nulla eu mi interdum vehicula. Maecenas ultricies neque ut libero hendrerit imperdiet.

Vestibulum at pharetra magna, sed gravida enim. Curabitur ante purus, vehicula vel mauris sit amet, scelerisque tincidunt lacus. Nam malesuada imperdiet nisl. Integer rhoncus ligula consequat ligula mollis feugiat. Ut feugiat elementum pharetra. Suspendisse nisi enim, pellentesque vitae congue sit amet, vulputate eu lectus. Nulla in metus nec sem consequat interdum id et diam.

Sed malesuada tortor quis ligula lacinia porttitor. Donec sodales eget nulla at mattis. Nam commodo nisi sit amet arcu pharetra, eu rutrum sem aliquam. Curabitur vel metus justo. Sed quis turpis erat. Nulla accumsan neque viverra tortor commodo, a condimentum lacus faucibus. Suspendisse elit dui, ullamcorper ut ornare a, molestie eu ligula.

Duis viverra molestie urna condimentum auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse potenti. Aenean eu massa erat. Mauris quis arcu vel ligula iaculis porta. Aenean vel augue eget lorem semper pretium. Proin non sapien nisi. Vivamus et sagittis tellus. Vivamus eget eleifend lectus.

')

company1.questions << question2
company1.questions << question4

user1.questions << question1
user4.questions << question3
user5.questions << question5
user5.questions << question6
user5.questions << question7
user3.questions << question8

user3.answers << answer1
user2.answers << answer2
company1.answers << answer3

question1.answers << answer1
question2.answers << answer3
question7.answers << answer2

comment1 = Comment.create!(content: 'Great answer!')
comment2 = Comment.create!(content: 'Needed to read this today!')
comment3 = Comment.create!(content: 'I disagree about the Lorem bit.  ')
comment4 = Comment.create!(content: 'Spot on!')
comment5 = Comment.create!(content: 'Cool!')
comment6 = Comment.create!(content: 'Awesome!')
comment7 = Comment.create!(content: 'Great Quote!')
comment8 = Comment.create!(content: 'This is silly!')
comment9 = Comment.create!(content: 'Troll!')
comment10 = Comment.create!(content: 'Super Troll!')

answer1.comments << comment1
answer1.comments << comment2
answer1.comments << comment3
answer2.comments << comment4
answer2.comments << comment5
answer2.comments << comment6
answer2.comments << comment7
answer2.comments << comment8
answer3.comments << comment9
answer3.comments << comment10

user1.comments << comment1
user4.comments << comment2
user5.comments << comment3
user5.comments << comment4
user5.comments << comment5
user2.comments << comment6
user4.comments << comment7
user2.comments << comment8
user3.comments << comment9
user2.comments << comment10


University.create(name: "Aberystwyth University")
University.create(name: "Accrington & Rossendale College")
University.create(name: "American InterContinental University - London")
University.create(name: "Amersham & Wycombe College")
University.create(name: "Anglia Ruskin University")
University.create(name: "Anglo European College of Chiropractic")
University.create(name: "Askham Bryan College")
University.create(name: "Aston University, Birmingham")
University.create(name: "Bangor University")
University.create(name: "Barking and Dagenham College")
University.create(name: "Barnet and Southgate College")
University.create(name: "Basingstoke College of Technology")
University.create(name: "Bath Spa University")
University.create(name: "Bedford College")
University.create(name: "Birkbeck, University of London")
University.create(name: "Birmingham City University")
University.create(name: "Birmingham Metropolitan College")
University.create(name: "Bishop Burton College")
University.create(name: "Bishop Grosseteste University College Lincoln")
University.create(name: "Blackburn College")
University.create(name: "Blackpool and The Fylde College An Associate College of Lancaster University")
University.create(name: "Bournemouth University")
University.create(name: "BPP University College of Professional Studies Limited")
University.create(name: "Bradford College: An Associate College of Leeds Metropolitan University")
University.create(name: "Bridgwater College")
University.create(name: "Brighton and Sussex Medical School")
University.create(name: "Bristol Filton College")
University.create(name: "Bristol, City of Bristol College")
University.create(name: "British College of Osteopathic Medicine")
University.create(name: "British Institute of Technology & E- commerce")
University.create(name: "British School of Osteopathy")
University.create(name: "Brooklands College")
University.create(name: "Brooksby Melton College")
University.create(name: "Brunel University")
University.create(name: "Buckinghamshire New University")
University.create(name: "Cambridge School of Visual & Performing Arts")
University.create(name: "Canterbury Christ Church University")
University.create(name: "Cardiff Metropolitan University (UWIC)")
University.create(name: "Cardiff University")
University.create(name: "Carshalton College")
University.create(name: "Central School of Speech and Drama, University of London")
University.create(name: "Chichester College")
University.create(name: "City and Islington College")
University.create(name: "City College Coventry")
University.create(name: "City College, Birmingham")
University.create(name: "City of Bath College")
University.create(name: "City of Sunderland College")
University.create(name: "City of Westminster College")
University.create(name: "City University")
University.create(name: "Cleveland College of Art and Design")
University.create(name: "Cliff College")
University.create(name: "Colchester Institute")
University.create(name: "Coleg Llandrillo Cymru")
University.create(name: "Coleg Menai")
University.create(name: "Coleg Sir Gar / Carmarthenshire College")
University.create(name: "College of West Anglia")
University.create(name: "Cornwall College")
University.create(name: "Courtauld Institute of Art (University of London)")
University.create(name: "Coventry University")
University.create(name: "Craven College")
University.create(name: "Croydon College")
University.create(name: "De Montfort University")
University.create(name: "Dearne Valley College")
University.create(name: "Doncaster College")
University.create(name: "Duchy College")
University.create(name: "Dudley College of Technology")
University.create(name: "Durham University")
University.create(name: "Ealing, Hammersmith and West London College")
University.create(name: "East Riding College")
University.create(name: "East Surrey College (incorporating Reigate School of Art, Design and Media)")
University.create(name: "Easton College")
University.create(name: "Edge Hill University")
University.create(name: "Edge Hotel School")
University.create(name: "Edinburgh Napier University")
University.create(name: "European Business School, London")
University.create(name: "European School of Economics")
University.create(name: "European School of Osteopathy")
University.create(name: "Exeter College")
University.create(name: "Farnborough College of Technology")
University.create(name: "Glasgow Caledonian University")
University.create(name: "Gloucestershire College")
University.create(name: "Glyndwr University")
University.create(name: "Goldsmiths (University of London)")
University.create(name: "Gower College Swansea")
University.create(name: "Greenwich School of Management")
University.create(name: "Grimsby Institute of Further and Higher Education")
University.create(name: "Guildford College of Further and Higher Education")
University.create(name: "Harper Adams University College")
University.create(name: "Harrow College")
University.create(name: "Havering College of Further and Higher Education")
University.create(name: "Hereford College of Arts")
University.create(name: "Heriot-Watt University, Edinburgh")
University.create(name: "Heythrop College (University of London)")
University.create(name: "Highbury College")
University.create(name: "Holborn College")
University.create(name: "Hopwood Hall College")
University.create(name: "Hull College")
University.create(name: "Hull York Medical School")
University.create(name: "ifs School of Finance")
University.create(name: "Imperial College London")
University.create(name: "Institute of Education University of London")
University.create(name: "Islamic College for Advanced Studies")
University.create(name: "Istituto Marangoni")
University.create(name: "Kaplan Business and Law School")
University.create(name: "Keele University")
University.create(name: "Kensington College of Business")
University.create(name: "King's College London (University of London)")
University.create(name: "Kingston College")
University.create(name: "Kingston University")
University.create(name: "Kirklees College")
University.create(name: "Lakes College - West Cumbria")
University.create(name: "Lancaster University")
University.create(name: "LCA Business School, London")
University.create(name: "Leeds City College")
University.create(name: "Leeds College of Art & Design")
University.create(name: "Leeds College of Building")
University.create(name: "Leeds College of Music")
University.create(name: "Leeds Metropolitan University")
University.create(name: "Leeds Trinity University College")
University.create(name: "Leicester College")
University.create(name: "Lincoln College")
University.create(name: "Liverpool Community College")
University.create(name: "Liverpool Hope University")
University.create(name: "Liverpool John Moores University")
University.create(name: "London Electronics College")
University.create(name: "London Metropolitan University")
University.create(name: "London School of Accountancy and Management")
University.create(name: "London School of Commerce")
University.create(name: "London School of Economics and Political Science (University of London)")
University.create(name: "London School of Science and Technology")
University.create(name: "London South Bank University")
University.create(name: "Loughborough College")
University.create(name: "Loughborough University")
University.create(name: "Medway School of Pharmacy")
University.create(name: "Mid-Cheshire College")
University.create(name: "Middlesex University")
University.create(name: "Moulton College")
University.create(name: "Mountview Academy of Theatre Arts")
University.create(name: "Myerscough College")
University.create(name: "Nazarene Theological College")
University.create(name: "Neath Port Talbot College")
University.create(name: "NESCOT")
University.create(name: "New College Durham")
University.create(name: "New College Nottingham")
University.create(name: "New College Stamford")
University.create(name: "New College Telford")
University.create(name: "Newcastle College")
University.create(name: "Newcastle University")
University.create(name: "Newham College of Further Education")
University.create(name: "Newman University College, Birmingham")
University.create(name: "North East Worcestershire College")
University.create(name: "North Glasgow College")
University.create(name: "North Lindsey College")
University.create(name: "North Warwickshire and Hinckley College")
University.create(name: "Northbrook College Sussex")
University.create(name: "Northumberland College")
University.create(name: "Northumbria University")
University.create(name: "Norwich City College of Further and Higher Education (an Associate College of UEA)")
University.create(name: "Norwich University College Of The Arts (Was The Norwich School of Art and Design)")
University.create(name: "Nottingham Trent University")
University.create(name: "Oxford & Cherwell Valley College")
University.create(name: "Oxford Brookes University")
University.create(name: "Oxford University")
University.create(name: "Pearson College")
University.create(name: "Pembrokeshire College (Accredited College of University of Glamorgan)")
University.create(name: "Peninsula College of Medicine & Dentistry")
University.create(name: "Petroc (Formerly North Devon College)")
University.create(name: "Plymouth College of Art")
University.create(name: "Plymouth University")
University.create(name: "Queen Margaret University , Edinburgh")
University.create(name: "Queen Mary, University of London")
University.create(name: "Queen's University Belfast")
University.create(name: "Ravensbourne")
University.create(name: "Regent's College, London (incorporating Regent's Business School, London)")
University.create(name: "Richmond Upon Thames College")
University.create(name: "Richmond, The American International University in London")
University.create(name: "Roehampton University")
University.create(name: "Rose Bruford College")
University.create(name: "Rotherham College of Arts and Technology")
University.create(name: "Royal Academy of Dance")
University.create(name: "Royal Agricultural College")
University.create(name: "Royal Holloway, University of London")
University.create(name: "Royal Veterinary College (University of London)")
University.create(name: "Royal Welsh College of Music and Drama (Coleg Brenhinol Cerdd a Drama Cymru)")
University.create(name: "Ruskin College Oxford")
University.create(name: "SAE Institute")
University.create(name: "Sandwell College")
University.create(name: "School of Oriental and African Studies (University of London)")
University.create(name: "Scottish Agricultural College")
University.create(name: "Sheffield College")
University.create(name: "Sheffield Hallam University")
University.create(name: "Solihull College")
University.create(name: "Somerset College of Arts and Technology")
University.create(name: "South Cheshire College")
University.create(name: "South Devon College")
University.create(name: "South Downs College")
University.create(name: "South East Essex College (partner of the University of Essex)")
University.create(name: "South Nottingham College")
University.create(name: "South Tyneside College")
University.create(name: "Southampton Solent University")
University.create(name: "Southport College")
University.create(name: "Sparsholt College Hampshire")
University.create(name: "St George's, University of London (formerly St George's Hospital Medical School)")
University.create(name: "St Helens College An Associate College of Liverpool John Moores University")
University.create(name: "St Mary's University College, Twickenham")
University.create(name: "St Patrick's College, London")
University.create(name: "Staffordshire University")
University.create(name: "Stephenson College Coalville")
University.create(name: "Stockport College")
University.create(name: "Stourbridge College")
University.create(name: "Stranmillis University College: A College of Queen's University Belfast")
University.create(name: "Stratford upon Avon College")
University.create(name: "Sussex Downs College")
University.create(name: "Swansea Metropolitan University")
University.create(name: "Swansea University")
University.create(name: "Swindon College")
University.create(name: "Tameside College")
University.create(name: "Teesside University")
University.create(name: "The Arts University College at Bournemouth")
University.create(name: "The College of Agriculture, Food and Rural Enterprise")
University.create(name: "The College of Haringey, Enfield and North East London")
University.create(name: "The College of Law")
University.create(name: "The Glasgow School of Art")
University.create(name: "The Liverpool Institute for Performing Arts")
University.create(name: "The London College, UCK")
University.create(name: "The Manchester College (Formerly Manchester College of Arts and Technology)")
University.create(name: "The Manchester Metropolitan University")
University.create(name: "The Robert Gordon University")
University.create(name: "The School of Pharmacy (University of London)")
University.create(name: "The University of Aberdeen")
University.create(name: "The University of Birmingham")
University.create(name: "The University of Bradford")
University.create(name: "The University of Buckingham")
University.create(name: "The University of Edinburgh")
University.create(name: "The University of Essex")
University.create(name: "The University of Gloucestershire")
University.create(name: "The University of Huddersfield")
University.create(name: "The University of Hull")
University.create(name: "The University of Kent")
University.create(name: "The University of Liverpool")
University.create(name: "The University of Manchester")
University.create(name: "The University of Nottingham")
University.create(name: "The University of Reading")
University.create(name: "The University of Salford")
University.create(name: "The University of Sheffield")
University.create(name: "The University of Stirling")
University.create(name: "The University of Strathclyde")
University.create(name: "The University of Warwick")
University.create(name: "The University of West London")
University.create(name: "The University of York")
University.create(name: "Tottenham Hotspur Foundation")
University.create(name: "Truro and Penwith College (Formerly Truro College)")
University.create(name: "Tyne Metropolitan College")
University.create(name: "UCP Marjon University College Plymouth St Mark & St John")
University.create(name: "University Campus Suffolk")
University.create(name: "University Centre Peterborough")
University.create(name: "University College Birmingham")
University.create(name: "University College Falmouth")
University.create(name: "University College London (University of London)")
University.create(name: "University for the Creative Arts (Formerly University College for the Creative Arts)")
University.create(name: "University of Abertay Dundee")
University.create(name: "University of Bath")
University.create(name: "University of Bedfordshire")
University.create(name: "University of Bolton")
University.create(name: "University of Brighton")
University.create(name: "University of Bristol")
University.create(name: "University of Cambridge")
University.create(name: "University of Central Lancashire")
University.create(name: "University of Chester")
University.create(name: "University of Chichester")
University.create(name: "University of Cumbria")
University.create(name: "University of Derby")
University.create(name: "University of Dundee")
University.create(name: "University of East Anglia")
University.create(name: "University of East London")
University.create(name: "University of Exeter")
University.create(name: "University of Glamorgan, Cardiff and Pontypridd")
University.create(name: "University of Glasgow")
University.create(name: "University of Greenwich")
University.create(name: "University of Hertfordshire")
University.create(name: "University of Leeds")
University.create(name: "University of Leicester")
University.create(name: "University of Lincoln")
University.create(name: "University of London Institute in Paris")
University.create(name: "University of Northampton")
University.create(name: "University of Portsmouth")
University.create(name: "University of Southampton")
University.create(name: "University of St Andrews")
University.create(name: "University of Sunderland")
University.create(name: "University of Surrey")
University.create(name: "University of Sussex")
University.create(name: "University of the Arts London")
University.create(name: "University of the Highlands and Islands")
University.create(name: "University of the West of England, Bristol")
University.create(name: "University of the West of Scotland")
University.create(name: "University of Ulster")
University.create(name: "University of Wales Trinity Saint David")
University.create(name: "University of Wales, Newport")
University.create(name: "University of Westminster")
University.create(name: "University of Winchester")
University.create(name: "University of Wolverhampton")
University.create(name: "University of Worcester")
University.create(name: "Uxbridge College")
University.create(name: "Wakefield College")
University.create(name: "Walsall College")
University.create(name: "Warrington Collegiate")
University.create(name: "Warwickshire College")
University.create(name: "West Cheshire College")
University.create(name: "West Thames College")
University.create(name: "Westminster Kingsway College")
University.create(name: "Wigan and Leigh College")
University.create(name: "Wiltshire College")
University.create(name: "Wirral Metropolitan College")
University.create(name: "Worcester College of Technology")
University.create(name: "Working Men's College")
University.create(name: "Writtle College")
University.create(name: "Yeovil College")
University.create(name: "York College")
University.create(name: "York St John University")
University.create(name: "Yorkshire Coast College of Further and Higher Education")



