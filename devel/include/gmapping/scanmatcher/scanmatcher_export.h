
#ifndef SCANMATCHER_EXPORT_H
#define SCANMATCHER_EXPORT_H

#ifdef SCANMATCHER_STATIC_DEFINE
#  define SCANMATCHER_EXPORT
#  define SCANMATCHER_NO_EXPORT
#else
#  ifndef SCANMATCHER_EXPORT
#    ifdef scanmatcher_EXPORTS
        /* We are building this library */
#      define SCANMATCHER_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define SCANMATCHER_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef SCANMATCHER_NO_EXPORT
#    define SCANMATCHER_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef SCANMATCHER_DEPRECATED
#  define SCANMATCHER_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef SCANMATCHER_DEPRECATED_EXPORT
#  define SCANMATCHER_DEPRECATED_EXPORT SCANMATCHER_EXPORT SCANMATCHER_DEPRECATED
#endif

#ifndef SCANMATCHER_DEPRECATED_NO_EXPORT
#  define SCANMATCHER_DEPRECATED_NO_EXPORT SCANMATCHER_NO_EXPORT SCANMATCHER_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef SCANMATCHER_NO_DEPRECATED
#    define SCANMATCHER_NO_DEPRECATED
#  endif
#endif

#endif /* SCANMATCHER_EXPORT_H */
