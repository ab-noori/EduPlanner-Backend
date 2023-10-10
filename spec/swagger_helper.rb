require 'rails_helper'

# Method to define user paths
def user_paths
  {
    get: {
      summary: 'Fetch all users',
      tags: ['Users'],
      responses: {
        '200': {
          description: 'OK',
          content: {
            'application/json': {
              schema: {
                type: 'array',
                items: { '$ref': '#/components/schemas/User' }
              }
            }
          }
        }
      }
    },
    post: {
      summary: 'Create a new user',
      tags: ['Users'],
      parameters: [],
      requestBody: {
        required: true,
        content: {
          'application/json': { schema: { '$ref': '#/components/schemas/User' } }
        }
      },
      responses: {
        '201': {
          description: 'User created successfully',
          content: {
            'application/json': { schema: { '$ref': '#/components/schemas/User' } }
          }
        },
        '422': {
          description: 'Invalid data - User not created',
          content: {
            'application/json': {
              schema: {
                type: 'object',
                properties: { error: { type: 'string' } }
              }
            }
          }
        }
      }
    }
  }
end

# Method to define course paths
def course_paths
  {
    get: {
      summary: 'Fetch all courses',
      tags: ['Courses'],
      responses: {
        '200': {
          description: 'OK',
          content: {
            'application/json': {
              schema: {
                type: 'array',
                items: { '$ref': '#/components/schemas/Course' }
              }
            }
          }
        }
      }
    },
    post: {
      summary: 'Create a new course',
      tags: ['Courses'],
      parameters: [],
      requestBody: {
        required: true,
        content: {
          'application/json': { schema: { '$ref': '#/components/schemas/Course' } }
        }
      },
      responses: {
        '201': {
          description: 'Course created successfully',
          content: {
            'application/json': { schema: { '$ref': '#/components/schemas/Course' } }
          }
        },
        '422': {
          description: 'Invalid data - Course not created',
          content: {
            'application/json': {
              schema: {
                type: 'object',
                properties: { error: { type: 'string' } }
              }
            }
          }
        }
      }
    }
  }
end

# Method to define reservation paths
def reservation_paths
  {
    get: {
      summary: 'Fetch all reservations',
      tags: ['Reservations'],
      parameters: [
        {
          name: 'user_id',
          in: 'query',
          description: 'ID of the user for filtering reservations',
          required: false,
          schema: { type: 'integer' }
        }
      ],
      responses: {
        '200': {
          description: 'OK',
          content: {
            'application/json': {
              schema: {
                type: 'array',
                items: { '$ref': '#/components/schemas/Reservation' }
              }
            }
          }
        }
      }
    },
    post: {
      summary: 'Create a new reservation',
      tags: ['Reservations'],
      parameters: [],
      requestBody: {
        required: true,
        content: {
          'application/json': { schema: { '$ref': '#/components/schemas/Reservation' } }
        }
      },
      responses: {
        '201': {
          description: 'Reservation created successfully',
          content: {
            'application/json': { schema: { '$ref': '#/components/schemas/Reservation' } }
          }
        },
        '422': {
          description: 'Invalid data - Reservation not created',
          content: {
            'application/json': {
              schema: {
                type: 'object',
                properties: { error: { type: 'string' } }
              }
            }
          }
        }
      }
    }
  }
end

# Method to define user schema
def user_schema
  {
    type: 'object',
    properties: {
      username: { type: 'string' }
    },
    required: %w[username]
  }
end

# Method to define course schema
def course_schema
  {
    type: 'object',
    properties: {
      name: { type: 'string' },
      description: { type: 'string' },
      image: { type: 'string' },
      fee: { type: 'number', format: 'float' },
      startDate: { type: 'string', format: 'date' }
    },
    required: %w[name description image fee startDate]
  }
end

# Method to define reservation schema
def reservation_schema
  {
    type: 'object',
    properties: {
      id: { type: 'integer' },
      start_date: { type: 'string', format: 'date' },
      end_date: { type: 'string', format: 'date' },
      city: { type: 'string' },
      user_id: { type: 'integer' }
    },
    required: %w[id start_date end_date city user_id]
  }
end

# Configure Swagger docs
RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'EduPlanner API',
        version: 'v1'
      },
      paths: {
        '/api/users': user_paths,
        '/api/courses': course_paths,
        '/api/reservations': reservation_paths
      },
      components: {
        schemas: {
          User: user_schema,
          Course: course_schema,
          Reservation: reservation_schema
        }
      },
      servers: [{
        url: 'https://{defaultHost}',
        variables: { defaultHost: { default: 'http://127.0.0.1:3000/api-docs/index.html' } }
      }]
    }
  }

  config.swagger_format = :yaml
end
