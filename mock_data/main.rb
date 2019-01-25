
#puts JSON.parse(ARGF.read).class

require 'json'
#puts JSON.pretty_generate(JSON.parse(ARGF.read))
require './resume.rb'

# resume array
file_string = File.read("./resume_db.json")
js = JSON.parse file_string
#jack=js[0]
#puts jack["basics"]["name"]
ret_hash = {}
resume_array = []
js.each do |resume|
     puts resume["basics"]["name"]
     resume_array << Resume.new(resume)
end

90.times do |i|
    
    resume_array << Resume.new(js[0])
end
# highlights
highlights_array = [{"id":1, "content": "AngularJS"},{"id":2, "content": "VUE"}]

# tags
tags_array = [
    {"id": 1,
        "content": "good at english",
        "resumes": [
            1,
            2,
            4
          ]
    },
        {
            "id": 2,
            "content": "experienced",
            "resumes": [
                4
              ]
          }        
]

# add stars temprary
stars_array = [
    {
      "id": 1,
      "star": 1,
      "resumes": [
        1
      ]
    },
    {
      "id": 2,
      "star": 2,
      "resumes": [
        3
      ]
    },
    {
      "id": 3,
      "star": 3,
      "resumes": [
        2
      ]
    },
    {
      "id": 4,
      "star": 4,
      "resumes": [
        2
      ]
    },
    {
      "id": 5,
      "star": 5,
      "resumes": [
        2
      ]
    }
  ]


# setting with tags and stars
resume_setting_array = [
	{
		"id": 1,
		"tags": [
			1,
			2
		],
		"stars": 5
	},
	{
		"id": 2,
		"tags": [
			2
		],
		"stars": 3
	}
]



# build final json object 
ret_hash["resumes"] = resume_array
ret_hash["highlights"] = highlights_array
ret_hash["tags"] = tags_array
ret_hash["stars"] = stars_array
ret_hash["resume_settings"] = resume_setting_array

#resume0 = Resume.new(js[0])


#puts "\n\n\n\n ##########################################3"
#puts JSON.parse(ARGF.read).class
fo = File.new("./"+ Time.now.to_s() +".json",'w')
#fo.write(JSON.pretty_generate js)
#fo.write(JSON.pretty_generate (JSON.parse(resume0.to_json) ))


fo.write(JSON.pretty_generate ret_hash )
#puts JSON.pretty_generate js
