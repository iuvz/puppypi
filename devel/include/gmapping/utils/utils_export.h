
#ifndef UTILS_EXPORT_H
#define UTILS_EXPORT_H

#ifdef UTILS_STATIC_DEFINE
#  define UTILS_EXPORT
#  define UTILS_NO_EXPORT
#else
#  ifndef UTILS_EXPORT
#    ifdef utils_EXPORTS
        /* We are building this library */
#      define UTILS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define UTILS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef UTILS_NO_EXPORT
#    define UTILS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef UTILS_DEPRECATED
#  define UTILS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef UTILS_DEPRECATED_EXPORT
#  define UTILS_DEPRECATED_EXPORT UTILS_EXPORT UTILS_DEPRECATED
#endif

#ifndef UTILS_DEPRECATED_NO_EXPORT
#  define UTILS_DEPRECATED_NO_EXPORT UTILS_NO_EXPORT UTILS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef UTILS_NO_DEPRECATED
#    define UTILS_NO_DEPRECATED
#  endif
#endif

#endif /* UTILS_EXPORT_H */
