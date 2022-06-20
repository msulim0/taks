task3 <- read.csv("data.csv")
library(dplyr)
library(tidyverse)

# invoice total price by date
total_pr <- select(task3, invoiceno, iInvoicedate, unitprice, quantity) %>%
  group_by(invoiceno, iInvoicedate) %>%
  mutate(amount_or = quantity * unitprice) %>%
  summarize(tot_am_by_invoice = sum(amount_or)) %>%
  arrange(iInvoicedate)

# total quantity of each customer's order
by_amount <- select(task3, invoiceno, customerid, quantity, unitprice) %>%
  group_by(invoiceno, customerid) %>%
  mutate(amount = quantity * unitprice) %>%
  summarize(total_quantity_by_invoice = n())

# customers order by date
by_date <- select(task3, customerid, quantity, unitprice, iInvoicedate) %>%
  group_by(customerid) %>%
  mutate(amount = quantity * unitprice) %>%
  summarize(tot_am_by_cm = sum(amount)) %>%
  arrange(customerid)

# merge
df = merge(x=total_pr,y=by_amount,by="invoiceno")
result_of_task = merge(x=df,y=by_date,by="customerid")