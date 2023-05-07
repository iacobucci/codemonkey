#!/bin/bash

export $(cat .env | xargs)

rails db:migrate
