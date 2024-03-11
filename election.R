# displays current working directory
getwd()


# delete the first 2 rows, store the file in the same directory
data=read.csv('Constituency_Wise_Detailed_Result.csv')

# print variable data
# data

summary(data)

# install package dplyr from bottom right side

library(dplyr)


# each constituency total votes
con_tot_vot = data %>% group_by(PC.NAME) %>% summarise(total_votes=sum(TOTAL)) %>%  select(PC.NAME, total_votes)
# con_tot_vot

con_tot_vot_df = data.frame(con_tot_vot)
con_tot_vot_df

write.csv(con_tot_vot_df, 'con_total.csv')

# constituency wise name of winning candidate
winning_can = data %>% group_by(PC.NAME) %>% filter(TOTAL==max(TOTAL)) %>% select(PC.NAME, CANDIDATES.NAME, TOTAL)
# winning_can
winning_can_df = data.frame(winning_can)
winning_can_df

# find the 2nd position in each constituency
second_place = data %>% group_by(PC.NAME) %>% arrange(desc(TOTAL)) %>% slice(2) %>% select (PC.NAME, CANDIDATES.NAME, TOTAL)
second_place
second_place_df = data.frame(second_place)
second_place_df

# find the margin - winning candidates votes - 2nd position votes
com_data = merge(winning_can_df, second_place_df, by='PC.NAME')
# com_data
com_data$margin = com_data$TOTAL.x - com_data$TOTAL.y
com_data
summary(com_data)

margin_data = com_data %>% group_by(PC.NAME) %>% summarise(margin=TOTAL.x - TOTAL.y) %>% select(PC.NAME, margin)
margin_data

# find the margin more than 10000
margin_data2 = margin_data %>% filter(margin > 10000) %>% select(PC.NAME, margin)
margin_data2

margin_data3 = com_data %>% group_by(PC.NAME) %>% summarise(margin=TOTAL.x - TOTAL.y) %>% filter(margin > 10000) %>% select(PC.NAME, margin)
margin_data3

# find the margin less than 10000
margin_data4 = margin_data %>% filter(margin < 20000) %>% select(PC.NAME, margin)
margin_data4

margin_data5 = com_data %>% group_by(PC.NAME) %>% summarise(margin=TOTAL.x - TOTAL.y) %>% filter(margin < 20000) %>% select(PC.NAME, margin)
margin_data5


#load data
data = read.csv("storDataSet.csv")
#load library dplyr
library(dplyr)

# candidates who won from each cons with the party name
candidate_won = data %>% group_by(PC.NAME) %>% filter(TOTAL==max(TOTAL)) %>% select(PC.NAME,CANDIDATES.NAME,TOTAL,PARTY.NAME)

#no of seats secured by each party
partwiseCount = candidate_won %>% group_by(PARTY.NAME) %>% count()

#total number of seats secured by each political party from maharashtra
#filter - where clause
totalCount = data %>% filter(State.Name=='Maharashtra') %>% group_by(PC.NAME)%>% filter(TOTAL== max(TOTAL))%>% select(PC.NAME,CANDIDATES.NAME,TOTAL,PARTY.NAME)
totalCount %>% group_by(PARTY.NAME)  %>% count()


#total votes secured by each political party in maharshtra
result = data %>% filter(State.Name=='Maharashtra') %>% group_by(PARTY.NAME) %>% summarise(total_votes_share=sum(TOTAL))