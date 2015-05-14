 Feature: MFR history

  As a MFR
  So that I can assess my performance
  I should be able to see the cases which I treated

Background: database status

   Given the following Users exist:
  | username     | password | name          | rollno   | phoneno     | gender | mfr  |
  | usaidm       | usaidm   | Usaid Mandvia | 16100215 | 03331310724 | Male   | true |
  | aminas       | aminas   | Amina Saeed   | 15110032 | 03216548927 | Female | true |
  | rashidm      | rashidm  | Rashid Minhas | 17100020 | 03455487851 | Male   | true |
  | areebat      | areebat  | Areeba Tayyab | 16100222 | 03154585269 | Female | true |
  | hammadm      |hammadm   | Hammad Mazhar | 16100032 | 03322485721 | Male   | false|
  | alinam       | alinam   | Alina Mahmood | 16110568 | 03132545682 | Female | false|
  | maham        | maham    | Maha Munawar  | 16100020 | 03322485121 | Female | false|
  | alBato       | alBato   | Alishba Batool| 16110168 | 03238845682 | Female | false|
  
  And the following Locations exist:
  | mfr_id | gps_latitude | gps_longitude | location |
  | 1      | 31.470855    | 74.412103     | M-6      |
  | 2      | 31.380445    | 74.412103     | SSE      |
  
  And the following Kits exist:
  | location  | details             | available |
  | SSE       | First Floor Lobby   | yes       |
  | SportsCom | EMS Room            | no        |
  | Rec Room  | PDC stall           | yes       |
  
  And the following Emergencies exist:
  
  | mfr_id| user_id  | location | severity | resolve_time| hospital_visited | created_at |updated_at|
  | 1   | 1   | SSE| low| 11:00PM, April 23,2015 | false | 10:50PM, April 23,2015| 11:05PM, April 23, 2015 |
  | 3   | 1   | M-6| high | 2:00PM, February 4 ,2015 | true| 12:00PM, February 4,2015| 2:10PM, February 4, 2015 | 
  
Scenario: get MFR's history
  Given I am on the login page
  And I  login as MFR "rashidm"
  When I follow "Treated Cases"
  Then I should be on the cases page
  And I should see "M-6"
  And I should see "16100032"
