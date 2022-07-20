
#ifndef SENSOR_RANGE_EXPORT_H
#define SENSOR_RANGE_EXPORT_H

#ifdef SENSOR_RANGE_STATIC_DEFINE
#  define SENSOR_RANGE_EXPORT
#  define SENSOR_RANGE_NO_EXPORT
#else
#  ifndef SENSOR_RANGE_EXPORT
#    ifdef sensor_range_EXPORTS
        /* We are building this library */
#      define SENSOR_RANGE_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define SENSOR_RANGE_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef SENSOR_RANGE_NO_EXPORT
#    define SENSOR_RANGE_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef SENSOR_RANGE_DEPRECATED
#  define SENSOR_RANGE_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef SENSOR_RANGE_DEPRECATED_EXPORT
#  define SENSOR_RANGE_DEPRECATED_EXPORT SENSOR_RANGE_EXPORT SENSOR_RANGE_DEPRECATED
#endif

#ifndef SENSOR_RANGE_DEPRECATED_NO_EXPORT
#  define SENSOR_RANGE_DEPRECATED_NO_EXPORT SENSOR_RANGE_NO_EXPORT SENSOR_RANGE_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef SENSOR_RANGE_NO_DEPRECATED
#    define SENSOR_RANGE_NO_DEPRECATED
#  endif
#endif

#endif /* SENSOR_RANGE_EXPORT_H */
