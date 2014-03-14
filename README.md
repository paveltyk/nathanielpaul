The Nathaniel Paul designs application
===

Required add-ons and 3rd party tools:
---

- Amazon S3
- SendGrid

Project setup
---

- **AWS credentials**

  example: heroku config:add AWS_ACCESS_KEY_ID=KEY AWS_SECRET_ACCESS_KEY=SECRET

- **Contact form recipient address is set through environment variable**

  example: ENV['CONTACT_EMAIL'] = 'example@gmail.com'

- **Admin password is set through environment variable**

  example: ENV['ADMIN_CREDENTIALS'] = 'login:password'

- **Enable user-env-compile lab feature on heroku for newly created instance**

  example: heroku labs:enable user-env-compile
