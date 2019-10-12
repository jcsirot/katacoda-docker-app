## Step Objectives

By the end of this exercise, you will have:

- Created a Docker Application package
- Learned about the application package components
- Learned how to validate the application
- Learned about building and inspecting an application

## Docker Application Overview

Application packages are a construction above compose files to improve application lifecycle and workflow, from development to test to production. An application package is a set of 3 documents:

1. A metadata.yml file describing the application metadata (name, version, description, ...)
2. A docker-compose.yml file describing the application structure (what we have right now)
3. A parameters.yml file with key/value parameters (we will use this in the next exercise)

You can also include any of your own custom files, including config files. These additional files are called attachments.

![Application](/jcsirot/scenarios/docker-app/assets/application.png)

## Initialize the Application

1. Let's look at the docker app init command and see it's options.

    `docker app init --help`{{execute}}

2. Let's now create our Docker app! We will use the docker app init command and specify the compose file.

    `docker app init voting-app --compose-file /root/docker-compose.yml`{{execute}}

3. If you run tree, you'll see a new directory. The name is your app name with a .dockerapp suffix. Let's look inside the directory.

    `tree`{{execute}}

4. The compose file is a copy of the file you were working with earlier. If you open the metadata.yml file, you'll see the config we specified during initialization.

    `cat voting-app.dockerapp/metadata.yml`{{execute}}

## Validating our Application

Before we're ready to ship our application, we should validate it to make sure everything is set. Specifically, validation does the following:

- Ensures our compose file is valid (correct syntax, etc.)
- Ensures required metadata is provided (name, version) and is the correct format
- Ensures all parameters (which we'll talk about next) have default values

1. Run the docker app validate command to make sure our application is valid.

    `docker app validate`{{execute}}

2. Let's make a change to invalidate the application. In the voting-app.dockerapp/metadata.yml file, comment out the `version` field using a `#`.

3. Then, revalidate.

    `docker app validate`{{execute}}

We have an error! Go ahead and fix it and revalidate.

## Building our Application

Once our application is ready, we can build it. Building an application means

- building all the service images, if they declare a build section
- building the invocation image (we will look closely at what is an invocation image in exercise 6).
- building the application image

1. Let's look at docker app build and its options

    `docker app build --help`{{execute}}


2. Build your application and give it a tag.

    `docker app build voting-app.dockerapp --tag username/voting-app:0.1.0`{{execute}}

    **NOTE:** The output may differ here. ⚠️ Replace username with your own Docker Hub nick handle.


🎉 You just built your first Docker Application Image ! It's now ready to be inspected, run or pushed!

**NOTE:** If you don't provide a tag during build, an application ID will be generated.

