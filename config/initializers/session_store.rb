Rails.application.config.session_store :cookie_store,
                                       key: "_historia_session",
                                       samesite: :lax,
                                       secure: Rails.env.production?
