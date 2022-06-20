task3 <- read.csv("data.csv")
library(dplyr)
library(tidyverse)

# invoice total price by date
total_pr <- select(task3, invoiceno, iInvoicedate, unitprice, quantity) %>%
  group_by(invoiceno, iInvoicedate) %>%
  mutate(amount_or = quantity * unitprice) %>%
  summarize(tot_am = sum(amount_or)) %>%
  arrange(iInvoicedate)
head(total_pr, 15)


# total amount and quantity of each customer's order
by_amount <- select(task3, customerid, quantity, unitprice) %>%
  group_by(customerid) %>%
  mutate(amount = quantity * unitprice) %>%
  summarize(total_order = n(),
            tot_am = sum(amount))
head(by_amount, 15)

# customers order by date
by_date <- select(task3, customerid, quantity, unitprice, iInvoicedate) %>%
  group_by(iInvoicedate, customerid) %>%
  mutate(amount = quantity * unitprice) %>%
  summarize(total_order = n(),
            tot_am = sum(amount)) %>%
  arrange(customerid)
head(by_date, 15)
