
#ifndef LOG_EXPORT_H
#define LOG_EXPORT_H

#ifdef LOG_STATIC_DEFINE
#  define LOG_EXPORT
#  define LOG_NO_EXPORT
#else
#  ifndef LOG_EXPORT
#    ifdef log_EXPORTS
        /* We are building this library */
#      define LOG_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define LOG_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef LOG_NO_EXPORT
#    define LOG_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef LOG_DEPRECATED
#  define LOG_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef LOG_DEPRECATED_EXPORT
#  define LOG_DEPRECATED_EXPORT LOG_EXPORT LOG_DEPRECATED
#endif

#ifndef LOG_DEPRECATED_NO_EXPORT
#  define LOG_DEPRECATED_NO_EXPORT LOG_NO_EXPORT LOG_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef LOG_NO_DEPRECATED
#    define LOG_NO_DEPRECATED
#  endif
#endif

#endif /* LOG_EXPORT_H */
