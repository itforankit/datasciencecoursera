install.packages("tidyr")
library(tidyr)
gather(students, sex,count,-grade)
res <-gather(students2, sex_class,count,-grade)
separate(data=res,col=sex_class,into=c("sex","class"))


students2 %>%
  gather( sex_class, count,-grade ) %>%
  separate( sex_class, c("sex", "class")) %>%
  print()


students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread( test,grade ) %>%
  print()

library(readr)
parse_number("class5")

students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  mutate(class=parse_number(class))  %>%
  print

student_info <- students4 %>%
  select(id ,name ,sex ) %>%
  print

student_info <- students4 %>%
  select(id, name, sex) %>%
  ### Your code here %>%
  unique() %>%
  print


gradebook <- students4 %>%
  select (id,class,midterm,final) %>%
  print

passed <- passed %>% mutate(status = "passed")
failed <- failed %>% mutate(status = "failed") 
bind_rows(passed,failed)


sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex,c("part","sex")) %>%
  print


sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  group_by(part,sex) %>%
  mutate(total=sum(count),
         prop=count/total) %>% print
