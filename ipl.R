#total runs scored by each batsman in ipl series
data = read.csv('ipl deliveries.csv')
summary(data)
library(dplyr)

#total runs scored by each batsman in ipl series
BATSMAN_TOTAL_RUNS = data %>% group_by(batsman) %>% summarise(total_runs = sum(batsman_runs)) %>% arrange(desc(total_runs))
BATSMAN_TOTAL_RUNS

#DETAILS OF BATSMAN WHO HAVE SCORED MORE THAN 4000 RUNS IN IPL
BATSMAN_TOTAL_RUNS %>% filter(total_runs>4000)

#find the total wickets taken by each bowler
TOTAL_WICKETS = data %>% filter(player_dismissed != "") %>% group_by(bowler) %>% count() %>% arrange(desc(n))
#or try this
TOTAL_WICKETS = data %>% filter(player_dismissed != "") %>% group_by(bowler) %>% summarise(no_of_wickets=n()) %>% arrange(desc(no_of_wickets))
#bowlers have taken more than 150wickets
TOTAL_WICKETS %>% filter(no_of_wickets>150) %>% arrange(desc(no_of_wickets))

#display columns Player Name, Total_runs, Average_runs, Total_wickets
TOTAL_WICKETS$player_name = TOTAL_WICKETS$bowler
BATSMAN_TOTAL_RUNS$player_name = BATSMAN_TOTAL_RUNS$batsman
player_info = merge(BATSMAN_TOTAL_RUNS, TOTAL_WICKETS, by="player_name")
player_info = player_info[,-3]


library(dplyr)
ipl_del = read.csv('IPL1.csv')
ipl_mat = read.csv('IPL2.csv')
ipl_data = merge( ipl_del,ipl_mat,by.x ='id',by.y ='match_id')
summary(ipl_data)
#find total runs scored by each batsman in season 2010
batsman_run_2010 = ipl_data %>% filter(season == 2010) %>% group_by(batsman) %>% summarise(totalrun_scored = sum(batsman_runs)) %>% arrange(desc(totalrun_scored))
batsman_run_2010
#OUTPUT
#batsman          totalrun_scored
<chr>                      <int>
1 SR Tendulkar                 618
2 JH Kallis                    572
3 SK Raina                     528
4 SC Ganguly                   493
5 M Vijay                      458
6 DPMD Jayawardene             445
7 A Symonds                    429
8 SS Tiwary                    419
9 RG Sharma                    404
10 NV Ojha                      377
#Ends
# in the season 2010 what was the top score of each batsman
batsman_run_2010 = ipl_data %>% filter(season == 2010) %>% group_by(batsman,id) %>% summarise(total_runs_scored = sum(batsman_runs))
batsman_run_2010
#OUTPUT
batsman     id total_runs_scored
<chr>    <int>             <int>
  1 A Kumble   197                 1
2 A Kumble   209                 1
3 A Kumble   220                 2
4 A Kumble   226                 1
5 A Kumble   231                 1
6 A Mishra   183                 3
7 A Mishra   185                 6
8 A Mishra   189                 0
9 A Mishra   213                 4
10 A Mishra   218                10
//ends
top_score_2010 = batsman_run_2010 %>% group_by(batsman) %>% summarise(max_runs = max(total_runs_scored)) %>% arrange(desc(max_runs))
top_score_2010
//OUTPUT
batsman          max_runs
<chr>               <int>
  1 M Vijay               127
2 DPMD Jayawardene      110
3 DA Warner             107
4 YK Pathan             100
5 NV Ojha                94
6 ML Hayden              93
7 JH Kallis              89
8 SR Tendulkar           89
9 CH Gayle               88
10 SC Ganguly             88
//ends 
// number of matches that took place in wankhede stadium
number_of_matches = ipl_del %>% filter(venue == 'Wankhede Stadium')%>% summarise(count_matches = n()) %>% arrange(desc(count_matches))
number_of_matches
//output
count_matches
1            73
//ends 
//which team scored maximum runs in wankhede stadium
number_of_matches = ipl_data %>% filter(venue == 'Wankhede Stadium')%>% group_by(batting_team)%>% summarise(top_team = sum(total_runs)) %>% arrange(desc(top_team))
number_of_matches
//output
batting_team                top_team
<chr>                          <int>
  1 Mumbai Indians                 11031
2 Chennai Super Kings             2225
3 Kings XI Punjab                 1968
4 Royal Challengers Bangalore     1706
5 Rajasthan Royals                1389
6 Kolkata Knight Riders           1297
7 Delhi Daredevils                1126
8 Sunrisers Hyderabad             1109
9 Pune Warriors                    389
10 Gujarat Lions                    323
11 Rising Pune Supergiant           322
12 Deccan Chargers                  235
13 Delhi Capitals                   219
14 Kochi Tuskers Kerala             184
15 Rising Pune Supergiants          126

