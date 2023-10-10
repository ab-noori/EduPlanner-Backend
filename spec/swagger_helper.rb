# frozen_string_literal: true

require 'rails_helper'

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
        '/api/users': {
          get: {
            summary: 'Get a list of users',
            responses: {
              '200': {
                description: 'Successful response',
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: {
                        '$ref': '#/components/schemas/User'
                      }
                    }
                  }
                }
              }
            }
          },
          post: {
            summary: 'Create a new user',
            requestBody: {
              required: true,
              content: {
                'application/json': {
                  schema: {
                    '$ref': '#/components/schemas/User'
                  }
                }
              }
            },
            responses: {
              '201': {
                description: 'User created successfully',
                content: {
                  'application/json': {
                    schema: {
                      '$ref': '#/components/schemas/User'
                    }
                  }
                }
              },
              '422': {
                description: 'Unprocessable Entity',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        error: { type: 'string' }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        '/api/courses': {
          get: {
            summary: 'Get a list of courses',
            responses: {
              '200': {
                description: 'Successful response',
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: {
                        '$ref': '#/components/schemas/Course'
                      }
                    }
                  }
                }
              }
            }
          },
          post: {
            summary: 'Create a new course',
            requestBody: {
              required: true,
              content: {
                'application/json': {
                  schema: {
                    '$ref': '#/components/schemas/Course'
                  }
                }
              }
            },
            responses: {
              '201': {
                description: 'Course created successfully',
                content: {
                  'application/json': {
                    schema: {
                      '$ref': '#/components/schemas/Course'
                    }
                  }
                }
              },
              '422': {
                description: 'Unprocessable Entity',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        error: { type: 'string' }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        '/api/reservations': {
          get: {
            summary: 'Get a list of reservations',
            parameters: [
              {
                name: 'user_id',
                in: 'query',
                description: 'ID of the user for filtering reservations',
                required: false,
                schema: {
                  type: 'integer'
                }
              }
            ],
            responses: {
              '200': {
                description: 'Successful response',
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: {
                        '$ref': '#/components/schemas/Reservation'
                      }
                    }
                  }
                }
              }
            }
          },
          post: {
            summary: 'Create a new reservation',
            requestBody: {
              required: true,
              content: {
                'application/json': {
                  schema: {
                    '$ref': '#/components/schemas/Reservation'
                  }
                }
              }
            },
            responses: {
              '201': {
                description: 'Reservation created successfully',
                content: {
                  'application/json': {
                    schema: {
                      '$ref': '#/components/schemas/Reservation'
                    }
                  }
                }
              },
              '422': {
                description: 'Unprocessable Entity',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        error: { type: 'string' }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      },
      components: {
        schemas: {
          User: {
            type: 'object',
            properties: {
              id: { type: 'integer' },
              name: { type: 'string' }
            },
            required: %w[id name]
          },
          Course: {
            type: 'object',
            properties: {
              name: { type: 'string' },
              description: { type: 'string' },
              image: { type: 'string' },
              fee: { type: 'number', format: 'float' },
              startDate: { type: 'string', format: 'date' }
            },
            required: %w[name description image fee startDate]
          },
          Reservation: {
            type: 'object',
            properties: {
              user_id: { type: 'integer' },
              course_id: { type: 'integer' },
              city: { type: 'string' },
              date: { type: 'string', format: 'date' }
            },
            required: %w[user_id course_id city date]
          }
        }
      },
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ]
    }
  }

  config.swagger_format = :yaml
end