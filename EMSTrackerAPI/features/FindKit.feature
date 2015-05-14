Feature: MFR kit availability
		As a MFR 
		So that I can treat patients quickly
		I should be able to see the first aid kits currently available
	
Background: database status

   Given the following Users exist:
  | username     | password | name          | rollno   | phoneno     | gender | mfr  |
  | usaidm    	 | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   | true |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female | true |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   | true |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female | true |
  | hammadm  	 | hammadm  | Hammad Mazhar | 16100032 | 03322485721 | Male   | false|
  | alinam	     | alinam   | Alina Mahmood | 16110568 | 03132545682 | Female | false|
  | hammadm  	 | hammadm  | Maha Munawar  | 16100020 | 03322485121 | Female | false|
  | alBato	     | alBato   | Alishba Batool| 16110168 | 03238845682 | Female | false|
  
  And the following Locations exist:
  | mfr_id | gps_latitude | gps_longitude | location |
  |	1	   | 31.470855    | 74.412103     | M-6      |
  | 2	   | 31.380445	  | 74.412103	  | SSE	     |
  
  And the following Kits exist:
  | location  | details 						| available |
  | SSE       | First Floor Lobby	  			| yes		|
  | SportsCom | EMS Room            			| no        |
  | Rec Room  | PDC stall						| yes		|
	
 Scenario: get available kits
 	Given I am on the login page
 	And I login as MFR "usaidm"
 	When I press "Available Kits"
 	Then I am on the available kits page
 	And I should see "SSE"
 	And I should see "Rec Room"

