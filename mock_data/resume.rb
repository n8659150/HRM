
#puts JSON.parse(ARGF.read).class

require 'json'
require 'csv'
#puts JSON.pretty_generate(JSON.parse(ARGF.read))



class Resume
    attr_accessor :id, :name, :label, :email, :phone, :city, :avatar, :summary, :work, :education, :skills, :languages, :star, :tags 
    @@count = 0
    # csv format is: name, email, city
    @@user_table = CSV.read("user.csv")
    @@position_list = ["President","Software Developer","Senior Software Developer", "Product Owner", "UI Designer", "Test Engineer", "Project Manager", "VP", "HR"      ]

    @@company_list = CSV.read("companys.csv").flatten
    @@university_list = CSV.read("university.csv").map{|r| r[1]}
    @@edu_area_list = CSV.read("majors-list.csv").map{|r| r[1]}
    @@language_list = ["Chinese","English","German", "French", "Spanish", "Japanese"]
    @@language_level_list = ["Basic","Fluent","Native Speaker"]

    @@summary_list = []
    @@summary_list << "Highly flexible and analytical professional with diverse capabilities in quality assurance, data analysis, and business analysis combined with a high level of resourcefulness and superior multitasking abilities. Sharp aptitude for mastering new technologies and technical expertise. Solid experience in regression, functional, and user acceptance testing. Brings exceptional creativity and attention to detail to tasks, projects, and assignments. Works effectively with multiple departments and stakeholders. "
    @@summary_list << "Full-Stack development on multiple projects for different customers using PHP 5.X,  PHP 7.X (OOP), JavaScript, jQuery, VUE.js. MongoDB, MySQL, SQL. CSS3, JSON,  HTML5, Bootstrap and Material Design, NPM, Composer, GULP. Apache and Nginx  as a web server. Laravel and Zend Frameworks as PHP MVC Frameworks."
    @@summary_list << "Self-motivated professional seeks to contribute interpersonal and organizational skills to enhance a company’s mission and profitability."
    @@summary_list << "Independent / Team Player with video production experience including managing video production projects from planning to completion and successfully meet tight deadlines. Proven track record in: shooting, editing, video conversion,  scriptwriting, content creation, and production management. ● High-level experience in Adobe Premiere, Final Cut Pro, After-Effects, AVID, and Audio editing software  ● Passion for Storytelling and creating a compelling message.● Knowledge of green screen process. ● Ability to coach “talent” and make them comfortable in front of the camera"
    @@summary_list << "Upon relocating to the Dallas-Fort Worth area from Chicago, to support of my spouse’s career aspirations, I had to make the difficult decision to leave my role at Tru Vue, after nearly 10 years with the organization. However, I am invigorated by the change and I am excited to pursue a new marketing leadership opportunity that will continue to stretch me professionally. With experience in both B2B and B2C, using both traditional and digital marketing tactics, I come equipped with a very versatile skill set. I am seeking a dynamic leadership position, with a wide scope of marketing and brand management responsibilities, with the ability to measure and see impact, and the opportunity to develop and lead a team of marketing professionals."
    @@summary_list << "Talented analyst in the field of relational database development and analysis working with complex customer data records in the billions. Skilled in both data analysis and customer service. Great proficiency with data manipulation tools as well as expertise in both email and direct mail marketing campaigns and strategy. In my position I was able to both expedite and provide quality improvements in our data collection and housing process as well as quickly producing direct marketing campaigns for clients. I take pride in my ability to produce remarkable performance with high standards including optimizing trend possibilities and growth opportunities through in depth data analysis."
    @@summary_list << "Lead QA Analyst/Scrum master with 10+ years with industry experience at Capella, Pearson, Cargill, Best Buy, and Medtronic among others. Have vast experience with manual/automation testing, designing, building, running, and maintaining test automation frameworks. Adept in Agile methodologies, coached, managed, worked with diverse cross functional project teams, both onshore and offshore."
    
    @@work_summary_list = []
    @@work_summary_list << "Process customer orders while communicating all essential elements of the sales script to ensure exemplary customer service and call quality.Address customer questions and concerns regarding product and delivery information.Tactfully negotiate and appease customers using a variety of methods established by Williams-Sonoma, Inc. guidelinesCheck inventory database and issue replacements and/or credit customers for damaged/defective merchandise.Analyze orders stopped in order processing department for errors & possible fraud.Calling out to customers and store for balance dues, declined credit cards, and verifying customer placed order."
    @@work_summary_list << "Provides health care tasks, personal hygiene services, housekeeping tasks and other related support services essential to the consumer’s health.Observes, records, and reports all changes to supervisor.All PCA’s must demonstrate competence in performing the necessary skills and only perform those skills on the plan of care"
    @@work_summary_list << "Provide client care and supervision that the parent or guardian would normally provide.Ensure the safety and well-being of client's in provider's care.Maintain the usual routine and management of the client family's household.Provide timely, complete, legible, and accurate documentation of all respite assignments and comply with all reporting requirements."
    @@work_summary_list << "Provided excellent customer service and upscale cashiering services to customers.Explained and encouraged customers to purchase warranties and memberships based on need and customer personality.Processed credit card and lease application for customers interested in those products."
    @@work_summary_list << "Training, supervising, motivating and assigning tasks to employees.Ensuring each worker performs his/her job well and realizes how it is a vital part of a team effort.Creating schedules and doing inventory."
    @@work_summary_list << "A leading source of information about risk, Verisk Analytics and ISO provide data, analytics, and decision-support services to professionals in many fields, including insurance, finance, real estate, health services, and government, human resources, and risk management. Using advanced technologies to collect, analyze, develop, and deliver information, Verisk helps customers evaluate and manage risk."
    
    def initialize(o)
      
      # @id = o["id"]
      # @name = o["basics"]["name"]
      # @label = o["basics"]["label"]
      # @email = o["basics"]["email"]
      # @phone = o["basics"]["phone"]
      # @city = o["basics"]["location"]["city"]
      # @avatar = o["basics"]["avatar"]
      # @summary = o["basics"]["summary"]
      # @work = o["work"]
      # @education = o["education"]
      # @skills = o["skills"]
      # @languages = o["languages"]
      @@count += 1
      @id = @@count
      @name = @@user_table[@@count][0]
      @label = @@position_list.sample
      @email = @@user_table[@@count][1]
      @phone = "(912) 555-4321"
      @city = @@user_table[@@count][2]
      @avatar = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6cm96JMnzdkSv8BgaD1608DF4CAtmURk_B0pyQbWksXEfWMmh4A"
      @summary = @@summary_list.sample
      #@languages = o["languages"]   
      @star = 0
      @tags = []  
      init_avatar
      init_skills
      init_work 
      init_edu
      init_language
    end
  
    def to_json(*args)
      {
        'id' => id,
        'name' => name,
        'label' => label,
        'email' => email,
        'phone' => phone,
        'city' => city,
        'avatar' => avatar,
        'summary' => summary,
        'work' => work,
        'education' => education,
        'skills' => skills,
        'languages' => languages,
        'star' => star,
        'tags' => tags,
      }.to_json(*args)
    end
  
    # string from JSON.parse
    def self.json_create(json_s)
      new(json_s)
    end

    def init_avatar
      @avatar = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6cm96JMnzdkSv8BgaD1608DF4CAtmURk_B0pyQbWksXEfWMmh4A"

    end

    def init_skills
      skills = %w(Sketch Photoshop AdobeXD Angular VUE React Python Ruby NodeJs)
      skills.shuffle!
      levels = %w(Master Professinal Amateur)

      skill_count = 2 + rand(5) 
      
      @skills = []
      skill_count.times do |i|
        t={}
        t["name"] = skills[i]
        t["level"] = levels.sample
        @skills << t
      end
    end

    def init_work
      companys = @@company_list.shuffle
      summarys = @@work_summary_list.shuffle
      # company_count = 2 + rand(5) 
      work_count = 1+ rand(4)
      @new_work = []
      work_count.times do |i|
        t = {}
        t["company"] = companys.pop
        t["position"] = @@position_list.sample
        t["website"] =  "https://www.google.com"
        t["startDate"] = "201"+ i.to_s + "-02-03"
        t["endDate"] = "201" + (i+1).to_s + "-02-03"
        t["summary"] = summarys.pop
        t["highlights"] = ["Innovative"]
        @new_work << t
      end
      @work = @new_work
    end

    def init_edu
      @education = []
      t={}
      t["institution"] = @@university_list.sample
      t["area"] = @@edu_area_list.sample
      t["studyType"]= ["Bachelor","Master","Doctorate"].sample
      t["startDate"]= "2009-01-01"
      t["endDate"]= "2011-01-01"
      t["gpa"]= rand(5).to_s + ".0"
      t["courses"]= [
        "DB1101 - Basic SQL"
      ]
      @education << t
    end

    def init_language
      @languages = []
      language_count = 1+ rand(3)
      languages = @@language_list.shuffle
    
      language_count.times do |i|
        t = {}
        t["language"] = languages.pop
        t["fluency"] = @@language_level_list.sample
        @languages << t
      end
    end

end



